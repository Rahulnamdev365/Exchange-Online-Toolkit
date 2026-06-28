# Exchange Online Toolkit

A modular PowerShell toolkit designed for Microsoft Exchange Online administrators to collect, review, and export Exchange Online configuration, mailbox, permissions, transport, and security information.

This project was built to simplify common Exchange Online administrative and auditing tasks through an interactive menu-driven interface while providing exportable CSV reports for documentation, troubleshooting, and operational reviews.

---

## Features

### Organization Reports

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

---

## Key Features

* Interactive menu-driven interface
* Modular PowerShell architecture
* Exchange Online connectivity
* CSV report export
* Structured folder organization
* Error handling and user-friendly console output
* Easily extendable with additional reports

---

## Project Structure

```text
Exchange-Online-Toolkit
│
├── Images
├── Logs
├── Modules
├── Reports
│   ├── Organization
│   ├── Mailboxes
│   ├── Permissions
│   ├── Security
│   └── Transport
├── Resources
├── SampleOutput
├── Main.ps1
├── LICENSE
└── README.md
```

---

## Requirements

* Windows PowerShell 5.1 or PowerShell 7+
* ExchangeOnlineManagement PowerShell Module
* Exchange Online Administrator permissions

Install the required module:

```powershell
Install-Module ExchangeOnlineManagement -Scope CurrentUser
```

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/<your-github-username>/Exchange-Online-Toolkit.git
```

Open PowerShell and launch the toolkit:

```powershell
.\Main.ps1
```

Connect to Exchange Online from the main menu before running reports.

---

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

---

## Screenshots

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

---

## Author

**Rahul J. Namdev**

Senior Microsoft 365 Engineer

**Technical Skills**

* Microsoft 365
* Exchange Online
* Entra ID
* PowerShell
* SharePoint Online
* Microsoft Defender
* Microsoft Graph

If you find this project useful, feel free to star the repository or provide suggestions for future improvements.

---

## License

This project is licensed under the MIT License.
