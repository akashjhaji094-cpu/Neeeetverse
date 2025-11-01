# NEETVerse Features Checklist

## Phase 1: Core App + Home Screen ✅

### Home Screen Layout
- [x] Logo & "NEETVerse — Study. Help. Earn." tagline
- [x] Exam Switcher (NEET/JEE toggle with color change)
- [x] Animated countdown chips (NEET & JEE exam dates)
- [x] XP quick card (Total + breakdown: Redeemable/Referral)
- [x] 3×3 action grid (9 cards with icons)
- [x] Mobile-first responsive design
- [x] Glassmorphism UI with blue-violet gradient

### Action Grid Cards
- [x] 1. Chat Your Competitor
- [x] 2. Buy Notes
- [x] 3. Sell Notes
- [x] 4. Earn by Solving Doubts
- [x] 5. Post Doubt
- [x] 6. Withdraw
- [x] 7. Refer & Earn
- [x] 8. Books / Test Series (Drive links)
- [x] 9. Daily Question / Leaderboard

### Onboarding
- [x] Welcome tooltip carousel (3 slides)
- [x] New user flow (Signup → Exam choice → +50 XP bonus)

---

## Phase 2: Auth, Profile & XP Accounting ✅

### Authentication
- [x] Email + password signup/login
- [x] Google OAuth integration (UI ready)
- [x] Username (unique, alphanumeric + _)
- [x] Exam preference selection

### Profile Screen
- [x] Avatar & username display
- [x] Exam badge
- [x] Level badges (Beginner → Scholar → Pro → Mentor)
- [x] XP breakdown (Redeemable, Referral, Pending)
- [x] Progress bar to next level
- [x] Quick action buttons

### XP System
- [x] Immutable ledger entries
- [x] XP breakdown in UI
- [x] Transaction history
- [x] Level progression
- [x] Badges (Verified Seller, Top Solver)

### XP Types
- [x] Redeemable XP (withdrawable)
- [x] Referral XP (in-app only)
- [x] Pending XP (awaiting verification)
- [x] Locked XP (for withdrawals)

---

## Phase 3: Chat + Doubt System ✅

### Public Chat Rooms
- [x] NEET: General, Study, Motivation, Doubts
- [x] JEE: General, Study, Motivation, Doubts
- [x] Message UI (username, time, exam tag)
- [x] Text + emoji only (no links/images)

### Moderation
- [x] Profanity filter setup
- [x] Report button per message
- [x] Admin moderation queue

### Doubt System (Image-Only)
- [x] Title + optional description (max 80 chars)
- [x] Image upload (up to 2 images, max 5MB each)
- [x] Subject & chapter selection (auto-suggest)
- [x] Cost: 6 XP to post
- [x] Answer with text + optional image
- [x] Asker accepts answer → +5 XP to answerer
- [x] Auto-close after 72h if unanswered

---

## Phase 4: Notes Marketplace ✅

### Seller Flow
- [x] Create listing form (title, subject, chapter, price in XP)
- [x] Upload 2-3 sample page images
- [x] Full notes Drive link upload
- [x] Description (max 300 chars)
- [x] Ownership attestation checkbox (mandatory)
- [x] Pending review for new sellers

### Buyer Flow
- [x] Browse marketplace (filter by subject, exam, price)
- [x] Confirm purchase modal
- [x] XP deduction (redeemable first, then referral if allowed)
- [x] Instant access to notes

### Quality & Trust
- [x] Star rating (1-5) & reviews
- [x] Verified Seller badge
- [x] Sales count display
- [x] Dispute handling UI

### Settlement
- [x] Seller XP credited immediately (locked for 7 days)
- [x] Platform fee configurable (default 10%)
- [x] Admin can release locked XP early

---

## Phase 5: XP Economy & Referral ✅

### XP Conversion
- [x] Configurable rate (default: 1 ₹ = 10 XP)
- [x] Minimum top-up (default: ₹10)
- [x] Minimum withdrawal (default: 1000 XP = ₹100)
- [x] Withdrawal processing window (default: 24h)

### Referral System
- [x] Unique referral codes per user
- [x] +20 XP non-redeemable per verified referral
- [x] New user gets +50 XP welcome bonus
- [x] Referral XP usable for doubts & notes only
- [x] Abuse prevention (email verification required)

### Top-up (Manual UPI)
- [x] Amount input with XP calculation
- [x] UPI reference input
- [x] Screenshot upload
- [x] Admin verification checklist
- [x] Duplicate UTR prevention

### Withdrawal
- [x] Min 1000 XP requirement
- [x] UPI ID input
- [x] Account holder name
- [x] Processing window display
- [x] Admin approval workflow

---

## Phase 6: Manual UPI Top-up & Admin SOP ✅

### Top-up Page UI
- [x] Step-by-step instructions (3 steps)
- [x] UPI ID display (akash@upi)
- [x] QR code placeholder
- [x] Username display in UPI note instruction
- [x] Conversion rate clearly shown (1 ₹ = 10 XP)
- [x] Min top-up info (₹10)

### Admin Dashboard
- [x] Pending top-ups tab
- [x] Screenshot preview
- [x] Verify & Credit button
- [x] Reject with reason
- [x] Flag Fraud button
- [x] UTR uniqueness check

### Admin SOP
- [x] Verification checklist (7 steps)
- [x] Copy-paste response templates
- [x] Fraud detection patterns
- [x] Record keeping guidelines
- [x] Escalation procedures

---

## Phase 7: Admin Panel & Moderation ✅

### User Management
- [x] Search by username/email
- [x] View XP balances
- [x] View transactions
- [x] Manual XP adjustment (with reason)
- [x] Temporary ban/mute

### Content Moderation
- [x] Flag doubts (copyrighted, explicit)
- [x] Review reported messages
- [x] Ban/mute users
- [x] Profanity filter admin

### Configuration
- [x] Conversion rate setting
- [x] Min/max top-up amounts
- [x] Withdrawal lock days
- [x] Doubt cost XP
- [x] Reward XP per answer
- [x] Referral XP value

### Reports & Analytics
- [x] CSV exports (transactions, withdrawals, sales)
- [x] Fraud dashboard
- [x] Duplicate UTR report
- [x] Weekly metrics

---

## Phase 8: Launch & Growth ✅

### Launch Checklist
- [x] Privacy Policy & Terms & Conditions
- [x] DMCA takedown contact
- [x] Admin SOP documentation
- [x] Sample notes seeding
- [x] Profanity filter config
- [x] Analytics setup (GA)

### Go-to-Market
- [x] Invite-only beta (200 users)
- [x] Referral incentives (20 XP non-redeemable)
- [x] Welcome bonus (50 XP redeemable)
- [x] Leaderboard & contests setup

### Retention Features
- [x] Daily streak (optional +2 XP)
- [x] Daily Question feature
- [x] Weekly Top Solver prize
- [x] Leaderboard (daily, weekly, all-time)

---

## Anti-Fraud & Safety ✅

### Fraud Prevention
- [x] UTR uniqueness enforcement
- [x] Username verification in UPI note
- [x] Max daily top-ups per user (10)
- [x] Min verification time (1 hour configurable)
- [x] Auto-flag patterns (same IP, multiple accounts)
- [x] Fake seller policy (>3 complaints → disable)
- [x] KYC threshold (>₹10,000 withdrawals)

### Moderation
- [x] Profanity filter (configurable list)
- [x] Report system (spam, abuse, copyrighted)
- [x] Auto-mute after X warnings (default 3)
- [x] Image moderation flags
- [x] Sexual/personal content blocking

---

## Data Security ✅

- [x] Immutable transaction logs
- [x] Screenshot storage (secure)
- [x] XP ledger with reason tracking
- [x] Admin action audit logs
- [x] User session management
- [x] Input validation & sanitization

---

## UI/UX ✅

- [x] Glassmorphism design
- [x] Blue-violet gradients
- [x] Mobile-first layout
- [x] Bottom navbar (mobile), top navbar (desktop)
- [x] Responsive grid layouts
- [x] Smooth animations & transitions
- [x] Dark theme with light text
- [x] Icon-based navigation
- [x] Neon accents for CTAs

---

## Optional Future Features 🚀

- [ ] AI-powered image OCR for auto-tagging
- [ ] AI chatbot "Nova" (doubt helper)
- [ ] Algorithmic recommendations
- [ ] Escrow payment (platform holds %)
- [ ] Sponsored "Top Solver of Day" prizes
- [ ] Razorpay integration for payments
- [ ] Advanced analytics dashboard
- [ ] Moderator team management
- [ ] Community managers
- [ ] Live video tutoring
- [ ] Peer-to-peer study groups
- [ ] Exam pattern analysis
- [ ] Smart study scheduling

---

## Bug Fixes & Performance

- [ ] Optimize bundle size
- [ ] Enable service workers (offline mode)
- [ ] CDN for images
- [ ] Database query optimization
- [ ] Caching strategy
- [ ] Error boundary handling
- [ ] Memory leak prevention

---

**Last Updated:** November 2025
**Status:** MVP Complete ✅
