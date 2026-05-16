# Windows Autopilot Full Automation

PowerShell automation solution for Windows Autopilot device registration and provisioning using Microsoft Graph API and Microsoft Intune.

Designed to simplify and accelerate enterprise device onboarding workflows.

---

## Features

- Automated Windows Autopilot device registration
- Automated device assignment to dynamic groups through Autopilot Group Tags
- Integration with Microsoft Graph API
- Reduced manual provisioning activities
- Streamlined onboarding workflows
- Support for Microsoft Intune environments

---

## Technologies Used

- PowerShell
- Microsoft Graph API
- Microsoft Intune
- Windows Autopilot
- Microsoft Entra ID

---

## How It Works

1. Configure the Enterprise Application and App Registration
2. Assign the required Microsoft Graph API permissions
3. Update the tenant-specific variables inside the script
4. Ensure PowerShell execution policy allows script execution
5. Run the script
6. Devices will be automatically registered into Windows Autopilot and assigned to dynamic Microsoft Entra ID groups through Group Tags

---

## Purpose

This project was created to simplify repetitive onboarding tasks and improve efficiency during Windows Autopilot registration processes in enterprise environments.

---

## Disclaimer

This project is intended for educational and lab purposes.  
Always validate scripts and configurations before using them in production environments.
