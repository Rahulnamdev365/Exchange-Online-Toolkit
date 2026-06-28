# Exchange Online Toolkit

<<<<<<< HEAD
A modular PowerShell toolkit for Microsoft Exchange Online administration, reporting and auditing.

---

## Overview

Exchange Online Toolkit is an interactive PowerShell toolkit designed to help Microsoft 365 administrators collect, review and export Exchange Online configuration and reporting data.

The toolkit provides a menu-driven interface for common administrative tasks, making it easier to audit Exchange Online environments and export results to CSV for documentation or further analysis.
=======
A modular PowerShell toolkit designed for Microsoft Exchange Online administrators to collect, review, and export Exchange Online configuration, mailbox, permissions, transport, and security information.

This project was built to simplify common Exchange Online administrative and auditing tasks through an interactive menu-driven interface while providing exportable CSV reports for documentation, troubleshooting, and operational reviews.
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

---

## Features

### Organization Reports

<<<<<<< HEAD
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
=======
* Organization Configuration
* Accepted Domains
* Remote Domains

### Mailbox Reports

* Mailbox Statistics
* Shared Mailboxes
* Room Mailboxes
* Mailbox Forwarding

### Permissions Reports

* Full Access Permissions
* Send As Permissions
* Send On Behalf Permissions
* Calendar Permissions

### Transport Reports

* Mail Flow Rules
* Transport Configuration

### Security Reports

* DKIM Configuration
* Anti-Spam Policies
* Anti-Phishing Policies
* Safe Links Policies
* Safe Attachments Policies
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

---

## Key Features

<<<<<<< HEAD
- Interactive menu-driven interface
- Modular PowerShell architecture
- Exchange Online integration
- CSV export support
- Professional folder structure
- Error handling
- Easy to extend

---

## Folder Structure
=======
* Interactive menu-driven interface
* Modular PowerShell architecture
* Exchange Online connectivity
* CSV report export
* Structured folder organization
* Error handling and user-friendly console output
* Easily extendable with additional reports

---

## Project Structure
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

```text
Exchange-Online-Toolkit
│
├── Images
├── Logs
├── Modules
├── Reports
<<<<<<< HEAD
│   ├── Mailboxes
│   ├── Organization
=======
│   ├── Organization
│   ├── Mailboxes
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0
│   ├── Permissions
│   ├── Security
│   └── Transport
├── Resources
├── SampleOutput
├── Main.ps1
<<<<<<< HEAD
=======
├── LICENSE
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0
└── README.md
```

---

## Requirements

<<<<<<< HEAD
- Windows PowerShell 5.1 or PowerShell 7+
- ExchangeOnlineManagement PowerShell Module
- Exchange Online Administrator permissions
=======
* Windows PowerShell 5.1 or PowerShell 7+
* ExchangeOnlineManagement PowerShell Module
* Exchange Online Administrator permissions
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

Install the required module:

```powershell
Install-Module ExchangeOnlineManagement -Scope CurrentUser
```

---

## Getting Started

Clone the repository:

<<<<<<< HEAD
```powershell
git clone https://github.com/<your-github-username>/Exchange-Online-Toolkit.git
```

Open PowerShell and run:
=======
```bash
git clone https://github.com/<your-github-username>/Exchange-Online-Toolkit.git
```

Open PowerShell and launch the toolkit:
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

```powershell
.\Main.ps1
```

Connect to Exchange Online from the main menu before running reports.

---

<<<<<<< HEAD
## Sample Reports

The toolkit exports reports in CSV format.

Example reports include:

- MailboxStatistics.csv
- AcceptedDomains.csv
- DKIMConfiguration.csv
- MailFlowRules.csv
=======
## Reports Included

| Module       | Reports                                                                  |
| ------------ | ------------------------------------------------------------------------ |
| Organization | Organization Configuration, Accepted Domains, Remote Domains             |
| Mailboxes    | Mailbox Statistics, Shared Mailboxes, Room Mailboxes, Mailbox Forwarding |
| Permissions  | Full Access, Send As, Send On Behalf, Calendar Permissions               |
| Transport    | Mail Flow Rules, Transport Configuration                                 |
| Security     | DKIM, Anti-Spam, Anti-Phishing, Safe Links, Safe Attachments             |

---

## Sample Output

Reports are exported in CSV format for documentation, auditing, and further analysis.

Example output files:

* OrganizationConfiguration.csv
* AcceptedDomains.csv
* MailboxStatistics.csv
* FullAccessPermissions.csv
* MailFlowRules.csv
* DKIMConfiguration.csv
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

---

## Screenshots

<<<<<<< HEAD
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
=======
### Main Menu

> *(Add screenshot here)*

### Organization Reports

> *(Add screenshot here)*

### Mailbox Statistics

> *(Add screenshot here)*

### Security Reports

> *(Add screenshot here)*

### Sample CSV Output

> *(Add screenshot here)*

---

## Future Enhancements

Planned improvements for future releases include:

* Complete Health Check mode
* HTML report generation
* Logging framework
* Additional Exchange Online reports
* Report filtering and search options

---

## About the Project

This toolkit was developed as a personal project to demonstrate practical Microsoft Exchange Online administration and PowerShell automation skills.

It reflects real-world administrative tasks performed in Microsoft 365 environments and is intended to serve as a reusable toolkit for Exchange administrators.
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

---

## Author

**Rahul J. Namdev**

Senior Microsoft 365 Engineer

<<<<<<< HEAD
PowerShell | Exchange Online | Microsoft 365 | Entra ID
=======
**Technical Skills**

* Microsoft 365
* Exchange Online
* Entra ID
* PowerShell
* SharePoint Online
* Microsoft Defender
* Microsoft Graph

If you find this project useful, feel free to star the repository or provide suggestions for future improvements.
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0

---

## License

<<<<<<< HEAD
This project is licensed under the MIT License.
=======
This project is licensed under the MIT License.
>>>>>>> 939c860eed8d737505279abf19427b27d09955b0
