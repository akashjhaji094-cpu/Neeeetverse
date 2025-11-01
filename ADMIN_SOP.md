# NEETVerse Admin SOP - UPI Top-up Verification

## Overview
This document provides step-by-step instructions for verifying manual UPI top-ups and crediting XP to users.

## Pre-Requisites
- Admin account with access to Supabase/Firebase
- Access to incoming UPI transactions (check your phone)
- Spreadsheet for tracking (CSV export)

## Daily Admin Checklist

### 1. Access Admin Dashboard
- Log in as admin
- Navigate to: Dashboard → Top-ups → Pending
- Sort by "Most Recent"

### 2. Verification Process (Per Request)

#### Step 1: Check Request Details
- [ ] Open pending top-up request
- [ ] Note: Request ID, User, Amount (₹), XP Expected, Submitted At
- [ ] Click "View Screenshot"

#### Step 2: Verify Screenshot
- [ ] Screenshot is clear and legible
- [ ] Recipient UPI ID matches **akash@upi**
- [ ] Amount matches request (e.g., ₹100 for 1000 XP)
- [ ] UTR/Reference number is visible
- [ ] Screenshot is not old (check timestamp)

#### Step 3: Check UTR Uniqueness
- [ ] Look up UTR in system
- [ ] Verify it hasn't been used before (Check "Duplicate UTR Report")
- [ ] If duplicate: Flag both transactions for manual review

#### Step 4: Check Username in UPI Note
- [ ] If UPI note field is present in screenshot: Verify it matches username
- [ ] If not present: Accept if amount matches exactly

#### Step 5: Verify Transaction (Optional but Recommended)
- [ ] Open your phone UPI app
- [ ] Find incoming transaction matching amount & UTR
- [ ] Confirm sender details (if visible)
- [ ] Note the transaction time

#### Step 6: Decision

**✅ VERIFY & CREDIT IF:**
- Screenshot is clear
- Recipient is "akash@upi"
- Amount matches
- UTR is valid & not duplicate
- Username matches (if provided)

**❌ REJECT IF:**
- Screenshot is blurry/not legible
- Amount doesn't match request
- UTR already verified
- Username in note doesn't match
- Screenshot appears old (>24h)

#### Step 7: Action

**If Verified:**
```
Click: "Verify & Credit XP"
Confirm: Yes
System will:
  ✓ Credit XP to user's redeemable_xp
  ✓ Create transaction log
  ✓ Send confirmation email to user
  ✓ Mark request as "verified"
```

**If Rejected:**
```
Click: "Reject"
Reason: [Select from dropdown]
Message: "Screenshots don't match requirements. Please re-submit..."
System will:
  ✓ Notify user with rejection reason
  ✓ Move request to rejected tab
  ✓ Keep for 30-day history
```

**If Suspicious:**
```
Click: "Flag Fraud"
Note: "Duplicate UTR attempt" or "Multiple accounts same IP"
System will:
  ✓ Lock user account pending review
  ✓ Flag for follow-up
  ✓ Add to fraud dashboard
```

### 3. Copy-Paste Response Templates

**On Approval:**
```
✅ Payment verified — Request #{{ request_id }} — ₹{{ amount }} credited as {{ xp_expected }} XP
Ref: {{ utr }}
Your XP is now available. Thanks for using NEETVerse!
```

**On Rejection:**
```
❌ Payment proof not accepted — Request #{{ request_id }}
Reason: {{ reason }}
Please re-submit clear screenshot with valid UTR/reference number.
Need help? Reply to this message.
```

**On Duplicate UTR (Manual Review Needed):**
```
⚠️ Duplicate UTR detected — Request #{{ request_id }}
This UTR was used on: [date] for [amount]
To prevent fraud, we need manual review. Please contact us with additional details.
```

## Admin Dashboard Reference

### Columns in Pending Tab
| Column | Meaning |
|--------|---------|
| Request ID | Unique identifier |
| User | Username who made request |
| Amount (₹) | INR amount sent |
| XP Expected | (Amount × 10) |
| UTR | Transaction reference from UPI |
| Submitted At | When request was created |
| Screenshot | Click to open image |
| Actions | Verify, Reject, Flag |

### Tabs Overview
- **Pending**: Awaiting verification (default)
- **Verified**: Approved and credited
- **Rejected**: Failed verification
- **Flagged**: Suspicious/fraud cases

## Fraud Detection

### Red Flags
- [ ] Same UTR used multiple times
- [ ] Multiple requests from same IP/device
- [ ] Amount mismatch with screenshot
- [ ] Screenshot appears doctored/Photoshopped
- [ ] Username in UPI note doesn't match profile
- [ ] Rapid succession of requests (>5 in 1 hour)
- [ ] User account just created (<1 day)

### Actions on Fraud Suspicion
1. **Flag** the transaction
2. **Lock** user account (temporary)
3. **Preserve** evidence (screenshot URL, IP, device)
4. **Review** full transaction history
5. **Reach out** to user for clarification (optional)
6. **Whitelist** or **Ban** based on outcome

## Record Keeping

### Daily Exports
- [ ] Export CSV of verified transactions daily
- [ ] Email to admin account
- [ ] File naming: `topups_verified_YYYY-MM-DD.csv`

### Weekly Report
- [ ] Total verified amount (₹)
- [ ] Total XP credited
- [ ] Rejected count & reasons
- [ ] Fraud flags & status
- [ ] Share with founders

### Archive
- [ ] Keep screenshots for 90 days minimum
- [ ] Encrypted storage (Supabase Vault or similar)
- [ ] Backup to Google Drive weekly

## Configuration

### Adjustable Settings (Admin Panel)
```
┌─ XP Economy
├─ Conversion rate: 1 ₹ = 10 XP (adjust if needed)
├─ Minimum top-up: ₹10 (min XP: 100)
├─ Minimum withdrawal: 1000 XP (₹100)
├─ Max daily topups per user: 10
└─ Verification hold time: 0-24 hours

┌─ Fraud Settings
├─ Auto-flag duplicate UTR: ON
├─ Auto-flag multiple IPs: ON
├─ Ban after 3 rejections: ON
└─ KYC threshold: ₹10,000
```

## Monitoring

### Metrics to Track
- Average verification time
- Rejection rate (%)
- Fraud detection rate
- Total revenue (₹)
- User satisfaction

### Alerts
- Unusual activity (spike in rejections)
- Payment delays (UTR not received)
- System errors (transaction creation failed)

## Escalation

**If Issue:** → **Contact:**
- Payment not credited → Backend team
- User account locked → Support team
- Recurring fraud → Security team
- System down → DevOps team

---

**Last Updated:** November 2025
**Version:** 1.0 (MVP)
