# NEETVerse 🚀

**Study. Help. Earn.** — A comprehensive dual-exam (NEET + JEE) student ecosystem with XP-based economy, image-only doubt solving, notes marketplace, and community features.

## 🎯 What is NEETVerse?

NEETVerse is a gamified study platform where medical and engineering aspirants can:

- **Post doubts** (image-only) and earn XP by solving others' doubts
- **Buy & sell notes** using an XP economy
- **Join public chat rooms** with fellow students
- **Build a profile** with levels and badges
- **Earn XP** through referrals and achievements
- **Withdraw earnings** as real money (manual UPI)

## ✨ Features (MVP)

### 🏠 Home Screen
- Exam switcher (NEET/JEE)
- Live countdown to exam dates
- XP quick card (redeemable/referral breakdown)
- 3×3 action grid for quick access

### 🔐 Authentication
- Email/password signup
- Google OAuth-ready
- Unique username system

### 📚 Marketplace
- Buy verified notes (in XP)
- Sell your own notes
- Star ratings & reviews
- Seller verification badges

### 💬 Community
- Public chat rooms (exam & topic-specific)
- Image-based doubt posting (6 XP per doubt)
- Peer support & solutions
- Leaderboards & achievements

### 💰 XP Economy
- **Redeemable XP**: Earn → Withdraw as INR
- **Referral XP**: Non-redeemable, in-app only
- **Manual UPI top-up**: Verify screenshots, credit instantly
- Conversion: 1 ₹ = 10 XP

### 🛡️ Anti-Fraud
- UTR uniqueness enforcement
- Username verification in UPI notes
- Admin moderation dashboard
- Fraud detection & auto-flagging

## 🚀 Quick Start

### Option 1: Run Locally (Frontend Only)
```bash
# Clone/extract the project
git clone <repo> && cd neetverse

# Open in browser
open public/index.html

# Or use a local server (recommended)
python3 -m http.server 8000
# Visit http://localhost:8000
```

### Option 2: Deploy with Backend
```bash
# Install dependencies
npm install

# Set up .env file
cp .env.example .env

# Run database migrations
npm run migrate:db

# Start backend server
npm start
# Frontend served at http://localhost:3000
```

## 📁 Project Structure

```
neetverse/
├── public/
│   └── index.html              # Main HTML file
├── src/
│   ├── js/                     # JavaScript controllers
│   │   ├── app.js              # Main app logic
│   │   ├── auth.js             # Auth system
│   │   ├── xp-system.js        # XP economy
│   │   └── ...
│   └── css/                    # Glassmorphism styles
│       ├── style.css           # Main styles
│       └── responsive.css      # Mobile-first
├── backend/                    # Node.js backend (optional)
│   ├── server.js               # Express server
│   ├── routes/                 # API endpoints
│   └── controllers/            # Business logic
├── docs/                       # Documentation
│   ├── SETUP.md                # Setup guide
│   ├── ADMIN_SOP.md            # Admin procedures
│   ├── API_ROUTES.md           # Backend APIs
│   └── FEATURES.md             # Feature checklist
├── schema.sql                  # Database schema
└── package.json                # Dependencies
```

## 🎨 Design

- **Glassmorphism**: Frosted glass effects with blur
- **Blue-Violet Gradients**: Modern, eye-catching colors
- **Mobile-First**: Responsive from 320px to 1920px
- **Dark Theme**: Easy on the eyes during long study sessions
- **Neon Accents**: CTAs pop with vibrant gradients

## 📊 XP Economy

### Earning XP
- Sign up: +50 XP (redeemable)
- Post doubt: -6 XP (cost)
- Answer doubt accepted: +5 XP (redeemable)
- Referral verified: +20 XP (referral, non-redeemable)

### Spending XP
- Post doubt: 6 XP
- Buy notes: X XP (seller sets price)
- Marketplace access: Free

### Withdrawal
- Minimum: 1000 XP (₹100)
- Processing: 1–24 hours
- Method: Manual UPI transfer
- Requirement: Username verified, account >7 days old

## 🛠️ Admin Panel

Admins can:
- Verify manual UPI top-ups
- Approve/reject note listings
- Moderate chat rooms & doubts
- Manage users (ban, adjust XP)
- Configure system parameters
- Export reports (CSV)
- Monitor fraud attempts

## 🔒 Security & Anti-Fraud

- ✅ Immutable XP ledger
- ✅ UTR uniqueness checks
- ✅ Username verification in UPI notes
- ✅ Duplicate account detection (same IP/device)
- ✅ Screenshot validation
- ✅ Profanity filtering
- ✅ Report system with admin review
- ✅ Temporary/permanent bans

## 📱 Tech Stack

### Frontend
- **HTML5** — Semantic markup
- **CSS3** — Glassmorphism, gradients, animations
- **Vanilla JavaScript** — No frameworks (fast, lightweight)
- **LocalStorage** — Client-side data persistence

### Backend (Optional)
- **Node.js + Express** — REST API
- **Supabase/PostgreSQL** — Database
- **JWT** — Authentication
- **Multer** — File uploads

### DevOps
- **Docker** — Containerization (optional)
- **GitHub Actions** — CI/CD (optional)
- **Vercel/Heroku** — Hosting (optional)

## 📈 Growth Roadmap

### Phase 1 (MVP) ✅
- [x] Core app & home screen
- [x] Auth & profiles
- [x] Chat & doubts
- [x] Marketplace
- [x] XP economy
- [x] Manual UPI top-ups
- [x] Admin dashboard

### Phase 2 (Beta)
- [ ] Razorpay integration
- [ ] Image OCR (auto-tagging)
- [ ] AI chatbot "Nova"
- [ ] Recommendation engine

### Phase 3 (Growth)
- [ ] Live video tutoring
- [ ] Peer study groups
- [ ] Advanced analytics
- [ ] Mobile app (React Native)

## 🤝 Contributing

We're open to contributions! Please:
1. Fork the repo
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT License — See LICENSE file for details

## 👥 Credits

Built with ❤️ by the NEETVerse Team for NEET & JEE aspirants.

## 📞 Support

- **Issues**: GitHub Issues
- **Docs**: See `/docs` folder
- **Email**: support@neetverse.app
- **Telegram**: @neetverse_community

---

**Made with ❤️ by MediPrep**

[Live Demo](#) • [Documentation](./docs/SETUP.md) • [Report Bug](#)
