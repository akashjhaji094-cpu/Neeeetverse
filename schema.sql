-- ============================================
-- NEETVerse Database Schema (Supabase/PostgreSQL)
-- ============================================

-- Enable extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- Users Table
-- ============================================

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT UNIQUE NOT NULL,
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  exam TEXT NOT NULL CHECK (exam IN ('NEET', 'JEE')),

  -- XP Balances
  xp_redeemable INT DEFAULT 0,
  xp_referral INT DEFAULT 0,
  xp_pending INT DEFAULT 0,
  locked_xp INT DEFAULT 0,

  -- Level & Badges
  level_name TEXT DEFAULT 'Beginner',
  total_xp_earned INT DEFAULT 0,

  -- Status
  is_verified BOOLEAN DEFAULT FALSE,
  is_banned BOOLEAN DEFAULT FALSE,
  ban_until TIMESTAMP,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- XP Transactions (Immutable Ledger)
-- ============================================

CREATE TABLE xp_transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  change INT NOT NULL,
  balance_after INT NOT NULL,
  reason TEXT NOT NULL,

  related_id UUID,
  meta JSONB,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_xp_trans_user ON xp_transactions(user_id);
CREATE INDEX idx_xp_trans_reason ON xp_transactions(reason);

-- ============================================
-- Top-up Requests (Manual UPI)
-- ============================================

CREATE TABLE topup_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  amount_inr NUMERIC(10, 2) NOT NULL,
  xp_expected INT NOT NULL,

  upi_ref TEXT NOT NULL UNIQUE,
  screenshot_url TEXT,

  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'verified', 'rejected', 'flagged')),

  admin_id UUID,
  admin_note TEXT,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  verified_at TIMESTAMP
);

CREATE INDEX idx_topup_user ON topup_requests(user_id);
CREATE INDEX idx_topup_status ON topup_requests(status);

-- ============================================
-- Withdrawal Requests
-- ============================================

CREATE TABLE withdraw_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  xp_amount INT NOT NULL,
  equivalent_inr NUMERIC(10, 2) NOT NULL,

  upi_id TEXT NOT NULL,
  account_holder TEXT NOT NULL,

  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'paid')),

  admin_id UUID,
  admin_payout_id TEXT,
  utr_ref TEXT,

  requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  processed_at TIMESTAMP
);

CREATE INDEX idx_withdraw_user ON withdraw_requests(user_id);
CREATE INDEX idx_withdraw_status ON withdraw_requests(status);

-- ============================================
-- Notes (Marketplace)
-- ============================================

CREATE TABLE notes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  seller_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  title TEXT NOT NULL,
  subject TEXT NOT NULL,
  chapter TEXT NOT NULL,
  exam TEXT[] NOT NULL,

  price_xp INT NOT NULL,

  sample_urls TEXT[],
  full_link TEXT,

  description TEXT,

  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'removed')),

  seller_verified BOOLEAN DEFAULT FALSE,
  sales_count INT DEFAULT 0,
  avg_rating NUMERIC(3, 1) DEFAULT 0,
  review_count INT DEFAULT 0,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_notes_seller ON notes(seller_id);
CREATE INDEX idx_notes_status ON notes(status);
CREATE INDEX idx_notes_subject ON notes(subject);

-- ============================================
-- Purchases
-- ============================================

CREATE TABLE purchases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  buyer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  note_id UUID NOT NULL REFERENCES notes(id) ON DELETE CASCADE,

  price_xp INT NOT NULL,
  platform_fee_xp INT DEFAULT 0,
  seller_credit_xp INT NOT NULL,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_purchases_buyer ON purchases(buyer_id);
CREATE INDEX idx_purchases_note ON purchases(note_id);

-- ============================================
-- Reviews (Notes Ratings)
-- ============================================

CREATE TABLE reviews (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  note_id UUID NOT NULL REFERENCES notes(id) ON DELETE CASCADE,
  reviewer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_reviews_note ON reviews(note_id);

-- ============================================
-- Doubts
-- ============================================

CREATE TABLE doubts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  asker_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  exam TEXT NOT NULL,
  subject TEXT NOT NULL,
  chapter TEXT NOT NULL,

  title TEXT,
  image_urls TEXT[],

  cost_xp INT DEFAULT 6,

  status TEXT DEFAULT 'open' CHECK (status IN ('open', 'solved', 'closed')),

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  auto_close_at TIMESTAMP
);

CREATE INDEX idx_doubts_asker ON doubts(asker_id);
CREATE INDEX idx_doubts_status ON doubts(status);
CREATE INDEX idx_doubts_subject ON doubts(subject);

-- ============================================
-- Answers
-- ============================================

CREATE TABLE answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  doubt_id UUID NOT NULL REFERENCES doubts(id) ON DELETE CASCADE,
  answerer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  text TEXT NOT NULL,
  image_url TEXT,

  upvotes INT DEFAULT 0,
  accepted BOOLEAN DEFAULT FALSE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_answers_doubt ON answers(doubt_id);
CREATE INDEX idx_answers_answerer ON answers(answerer_id);

-- ============================================
-- Chat Messages
-- ============================================

CREATE TABLE chat_messages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id TEXT NOT NULL,
  sender_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  text TEXT NOT NULL,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_chat_room ON chat_messages(room_id);
CREATE INDEX idx_chat_sender ON chat_messages(sender_id);

-- ============================================
-- Chat Reports (Moderation)
-- ============================================

CREATE TABLE chat_reports (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  message_id UUID NOT NULL REFERENCES chat_messages(id) ON DELETE CASCADE,
  reporter_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  reason TEXT NOT NULL,
  admin_note TEXT,

  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'resolved', 'dismissed')),

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Referrals
-- ============================================

CREATE TABLE referrals (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  referrer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referee_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  referral_code TEXT NOT NULL UNIQUE,

  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'verified', 'cancelled')),

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  verified_at TIMESTAMP
);

CREATE INDEX idx_referrals_referrer ON referrals(referrer_id);
CREATE INDEX idx_referrals_referee ON referrals(referee_id);

-- ============================================
-- Admin Audit Log
-- ============================================

CREATE TABLE admin_audit_log (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  admin_id UUID NOT NULL REFERENCES users(id),

  action TEXT NOT NULL,
  target_id UUID,
  note TEXT,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_audit_admin ON admin_audit_log(admin_id);

-- ============================================
-- Configuration (Key-Value)
-- ============================================

CREATE TABLE config (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default config
INSERT INTO config (key, value) VALUES
  ('rupee_to_xp', '10'),
  ('min_topup_rupee', '10'),
  ('min_withdraw_xp', '1000'),
  ('withdraw_process_hours', '24'),
  ('referral_xp_value', '20'),
  ('signup_bonus_xp', '50'),
  ('doubt_cost_xp', '6'),
  ('doubt_reward_xp', '5'),
  ('platform_fee_percent', '10'),
  ('seller_lock_days', '7'),
  ('max_daily_topups', '10'),
  ('auto_ban_warnings', '3')
ON CONFLICT (key) DO NOTHING;

-- ============================================
-- Row-Level Security (RLS) - Optional
-- ============================================

-- Enable RLS on sensitive tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE xp_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE topup_requests ENABLE ROW LEVEL SECURITY;

-- Users can only see own data
CREATE POLICY "users_select" ON users FOR SELECT USING (auth.uid()::text = id::text OR is_verified = true);
CREATE POLICY "users_update" ON users FOR UPDATE USING (auth.uid()::text = id::text);

-- ============================================
-- Triggers (Auto-update timestamp)
-- ============================================

CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_users_timestamp BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_notes_timestamp BEFORE UPDATE ON notes
  FOR EACH ROW EXECUTE FUNCTION update_timestamp();
