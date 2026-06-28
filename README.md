# Exchange Online Toolkit

A modular PowerShell toolkit for Microsoft Exchange Online administration, reporting and auditing.

---

## Overview

Exchange Online Toolkit is an interactive PowerShell toolkit designed to help Microsoft 365 administrators collect, review and export Exchange Online configuration and reporting data.

The toolkit provides a menu-driven interface for common administrative tasks, making it easier to audit Exchange Online environments and export results to CSV for documentation or further analysis.

---

## Features

### Organization Reports

- Organization Configuration
- Accepted Domains
- Remote Domains

### Mailbox Reports

- Mailbox Statistics
- Shared Mailboxes
- Room Mailboxes
- Mailbox Forwarding

### Permissions Reports

- Full Access Permissions
- Send As Permissions
- Send On Behalf Permissions
- Calendar Permissions

### Transport Reports

- Mail Flow Rules
- Transport Configuration

### Security Reports

- DKIM Configuration
- Anti-Spam Policies
- Anti-Phishing Policies
- Safe Links Policies
- Safe Attachments Policies

---

## Key Features

- Interactive menu-driven interface
- Modular PowerShell architecture
- Exchange Online integration
- CSV export support
- Professional folder structure
- Error handling
- Easy to extend

---

## Folder Structure

```text
Exchange-Online-Toolkit
│
├── Images
├── Logs
├── Modules
├── Reports
│   ├── Mailboxes
│   ├── Organization
│   ├── Permissions
│   ├── Security
│   └── Transport
├── Resources
├── SampleOutput
├── Main.ps1
└── README.md
```

---

## Requirements

- Windows PowerShell 5.1 or PowerShell 7+
- ExchangeOnlineManagement PowerShell Module
- Exchange Online Administrator permissions

Install the required module:

```powershell
Install-Module ExchangeOnlineManagement -Scope CurrentUser
```

---

## Getting Started

Clone the repository:

```powershell
git clone https://github.com/<your-github-username>/Exchange-Online-Toolkit.git
```

Open PowerShell and run:

```powershell
.\Main.ps1
```

Connect to Exchange Online from the main menu before running reports.

---

## Sample Reports

The toolkit exports reports in CSV format.

Example reports include:

- MailboxStatistics.csv
- AcceptedDomains.csv
- DKIMConfiguration.csv
- MailFlowRules.csv

---

## Screenshots

> Screenshots will be added in Version 1.0.

---

## Roadmap

### Version 1.0

- Interactive toolkit
- Organization reports
- Mailbox reports
- Permissions reports
- Transport reports
- Security reports

### Future Enhancements

- Complete Health Check
- HTML Reporting
- Logging
- Additional Exchange Online reports

---

## Author

**Rahul J. Namdev**

Senior Microsoft 365 Engineer

PowerShell | Exchange Online | Microsoft 365 | Entra ID

---

## License

This project is licensed under the MIT License.