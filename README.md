# Azure App Service
- Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends
- Scale up/down or scale out/in
- Essentially, it provides the ability to run apps in Linux or Windows VMs, in a private or public network
- Just deploy to Azure, without ACI or custom created VMs

## App Service plans
- An App Service plan defines a set of compute resources for a web app to run
- In App Service, an app (Web Apps, API Apps, or Mobile Apps) always runs in an App Service plan
- Azure Functions also has the option of running in an App Service plan
- App Service plan is the scale unit of the App Service apps 
- If the plan is configured to run five VM instances, then all apps in the plan run on all five instances
- If the plan is configured for autoscaling, then all apps in the plan are scaled out together based on the autoscale settings

## App Service plans - Types
# Non-isolated
- **Shared compute**
  - Both Free and Shared share the resource pools of your apps with the apps of other customers. 
    Essentially, my app runs in the same VM with other apps from other clients
- **Dedicated compute**
  - Basic (B1, B2, B3)
  - Standard (S1, S2, S3)
  - PremiumV2 (P1v2, P2v2, P3v2)
  - PremiumV3 (P1v3, P2v3, P3v3)

# Isolated
- Fully isolated and dedicated environment (dedicated Azure VMs on dedicated Azure Virtual Networks)
- Isolation and secure network access
- High scale, high memory utilization

# Consumption
- This tier is only available to function apps. It scales the functions dynamically depending on workload.

## How does my app run and scale
- In the Free and Shared tiers, an app receives CPU minutes on a shared VM instance and can't scale out
- In other tiers, an app runs and scales as follows:
  - An app runs on all the VM instances configured in the App Service plan.
  - If multiple apps are in the same App Service plan, they all share the same VM instances.
  - If you have multiple deployment slots for an app, all deployment slots also run on the same VM instances.
  - If you enable diagnostic logs, perform backups, or run WebJobs, they also use CPU cycles and memory on these VM instances.

## Secure a domain with SSL/TLS binding
- cannot be done for the Free and Shared tiers
- can use public(bought from an authority) and private(self-signed) certificates
- Managed certificate -> one that is provided and managed by Azure
- Un-managed certificate -> one that is provided by me (public or private)
- can enforce HTTPS and TLS versions

