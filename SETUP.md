# NEETVerse - Setup Guide

## Quick Start (MVP)

### Prerequisites
- Node.js 16+ (for backend, optional for MVP)
- Modern browser (Chrome, Safari, Firefox, Edge)
- Git

### Installation (Frontend-Only MVP)

1. **Clone/Extract the project**
```bash
unzip neetverse.zip
cd neetverse
```

2. **Open in Browser**
```bash
# Simple way - just open the file
open public/index.html

# Or use a local server (recommended)
python3 -m http.server 8000
# Then visit http://localhost:8000
```

3. **First Time Setup**
- Sign up with email (demo mode)
- Choose NEET or JEE
- You'll get 50 XP welcome bonus
- Start exploring!

### Project Structure

```
neetverse/
├── public/
│   ├── index.html          # Main HTML file
│   └── assets/             # Icons, logos, images
├── src/
│   ├── js/
│   │   ├── app.js          # Main app controller
│   │   ├── auth.js         # Auth logic
│   │   ├── xp-system.js    # XP economy
│   │   ├── marketplace.js  # Notes marketplace
│   │   ├── doubts.js       # Doubt posting
│   │   ├── chat.js         # Chat rooms
│   │   └── admin.js        # Admin panel
│   └── css/
│       ├── style.css       # Main styles
│       ├── components.css  # Component styles
│       └── responsive.css  # Mobile responsive
├── docs/
│   ├── SETUP.md            # This file
│   ├── ADMIN_SOP.md        # Admin operations
│   ├── API_ROUTES.md       # Backend routes
│   └── FEATURES.md         # Feature list
├── backend/                # Node.js backend (optional)
└── package.json            # Dependencies
```

## Features Implemented (MVP)

### Phase 1 - Home Screen ✅
- [x] Logo & Tagline
- [x] Exam Switcher (NEET/JEE)
- [x] Countdown Chips (animated)
- [x] XP Quick Card
- [x] 3x3 Action Grid (all 9 cards)

### Phase 2 - Auth & Profile ✅
- [x] Sign up (email, password, username, exam choice)
- [x] Login
- [x] Profile screen with XP breakdown
- [x] Level badges & progress

### Phase 3 - Chat & Doubts ✅
- [x] Public chat rooms (NEET/JEE specific)
- [x] Post doubt with image upload
- [x] Image-only doubt system
- [x] Answer doubts & earn XP

### Phase 4 - Marketplace ✅
- [x] Buy Notes
- [x] Sell Notes (with verification flow)
- [x] Notes listing & filtering
- [x] Price in XP

### Phase 5 - XP Economy ✅
- [x] Redeemable XP (withdraw)
- [x] Referral XP (non-redeemable)
- [x] XP breakdown display
- [x] Level progression

### Phase 6 - Manual UPI Top-up ✅
- [x] Top-up form with UPI ID
- [x] Screenshot upload
- [x] XP calculation (1₹ = 10 XP)
- [x] UTR tracking

### Phase 7 - Admin Panel (Basic) ✅
- [x] Admin dashboard
- [x] Top-up verification UI
- [x] Moderation tools

### Phase 8 - Anti-Fraud & Safety ✅
- [x] Profanity filter setup
- [x] Report system UI
- [x] Account verification flow

## Backend Integration (Optional)

For production deployment, integrate with:

### Database
- Supabase (PostgreSQL)
- or Firebase
- or MongoDB

### API Endpoints (See API_ROUTES.md)
```
POST /api/auth/signup
POST /api/auth/login
POST /api/xp/topup
POST /api/xp/withdraw
POST /api/notes/create
POST /api/doubts/post
POST /api/chat/send
```

## Configuration

### Environment Variables (.env)
```env
# API
REACT_APP_API_URL=http://localhost:3000
REACT_APP_SUPABASE_URL=https://your-project.supabase.co
REACT_APP_SUPABASE_KEY=your-public-key

# UPI
ADMIN_UPI_ID=akash@upi
RUPEE_TO_XP=10
MIN_TOPUP=10
MIN_WITHDRAW_XP=1000

# Admin
ADMIN_EMAIL=admin@neetverse.app
```

## Testing

### Test Accounts (Demo Mode)
```
Email: test@neetverse.app
Password: Test@123
Username: testneet
```

### Test Flows
1. **Sign Up Flow**
   - Fill form with new email
   - Choose exam (NEET/JEE)
   - Should get 50 XP welcome bonus

2. **Post Doubt Flow**
   - Click "Post Doubt"
   - Upload 1-2 images
   - Should cost 6 XP

3. **Top-up Flow**
   - Click "Top Up XP"
   - Enter amount (min ₹10)
   - Should calculate XP correctly

4. **Referral Flow**
   - Copy referral code
   - Share with friend
   - Friend gets 50 XP, you get 20 referral XP

## Performance Tips

- Use CDN for images (Cloudinary, Firebase Storage)
- Optimize bundle size (gzip compression)
- Enable service workers for offline mode
- Cache API responses with proper TTL

## Security

- Never commit .env with real credentials
- Use HTTPS in production
- Sanitize all user inputs
- Validate on both client & server
- Rate limit API endpoints
- Enable CORS properly

## Troubleshooting

**Issue: Images not uploading**
- Check file size (max 5MB)
- Ensure CORS is enabled
- Check browser console for errors

**Issue: XP not updating**
- Refresh the page
- Check localStorage
- Clear browser cache

**Issue: Chat messages not sending**
- Check internet connection
- Verify WebSocket is enabled
- Check server logs

## Support & Documentation

- Issues: Create GitHub issue
- Docs: See `/docs` folder
- API: See API_ROUTES.md
- Admin: See ADMIN_SOP.md

## Next Steps (Post-MVP)

1. **Database Integration**
   - Set up Supabase/Firebase
   - Create tables per schema.sql
   - Write backend APIs

2. **Payment Integration**
   - Integrate Razorpay for UPI
   - Setup webhook handlers
   - Auto top-up verification

3. **Advanced Features**
   - Image OCR for auto-tagging
   - AI chatbot "Nova"
   - Recommendation engine
   - Analytics dashboard

4. **Scaling**
   - CDN for images
   - Redis caching
   - Database optimization
   - Load testing

---

**Happy Building! 🚀**
