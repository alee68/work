# azure-notes

**Azure hierarchy (start to think what this should look like)**
1. Management Group
    1. Subscriptions
        1. Resource Groups
            1. Resource

**Tenant vs. Subscription**
- A **Tenant** is associated with a single identity (person, company, or organization) and can own one or several subscriptions
- A **Subscription** is linked to a payment setup and each subscription will result in a separate bill
- In every Subscription, you can add virtual resources (VM, storage,
    network, \...)

**Azure Advisor vs. Azure Monitor vs. Azure Sentinel**
- **[Azure Advisor]**
    - Azure Advisor provides personalized recommendations to optimize Azure resources for performance, security, reliability,
        and cost-effectiveness.
    - *Use Azure Advisor when you want to fine-tune your Azure resources based on best practices and cost efficiency.*

- **[Azure Monitor]**
    - Azure Monitor is an operational monitoring solution.
    - Integration:
        - Both Azure Sentinel and Defender for Cloud (formerly Azure Security Center) use the same agents and Azure Monitor Logs workspace for storing monitoring data.
    - Azure Monitor is largely a free service, but certain categories of alert rules and customer-managed data storage incur costs.

- **[Azure Sentinel]**
    - Azure Sentinel is a **Security Information and Event Management (SIEM)** solution for security monitoring, threat detection, and incident response capabilities.
    - Integration with Azure Monitor:
        - Sentinel and Azure Monitor share the same agents and workspace capabilities.Sentinel uses the same Azure Monitor Logs workspace for storing its monitoring dat1. Sentinel increases the price of the entire workspace, unlike Azure Monitor, which is largely free.

**Pricing Calcuator vs. TCO Calculator vs. Cost Management and Billing**
- **[Pricing Calculator]**
    - The Azure Pricing Calculator **helps you estimate costs for your Azure usage**. It allows you to turn anticipated usage into an estimated cost, making it easier to plan and budget.

- **[TCO (Total Cost of Ownership) Calculator]**
    - The TCO Calculator compares costs between an on-premises configuration and an Azure setup. It considers both direct and indirect costs.

- **[Cost Management and Billing]**
    - Cost Management provides tools and insights to **manage and optimize your Azure spending**.

**VNet peering vs. VNet to VNet connection via VPN Gateway**
- VNet Peering
- VNet to VNet connection via VPN Gateway (encrypts traffic)

**Azure Blueprints vs. ARM Templates**
- **[Azure Blueprints]**
    - Azure Blueprints are designed to address the challenge of deploying complex environments with multiple components. They allow you to package various elements (such as networking, security, compliance, and resource configurations) into a single reusable definition.
    - Ideal for scenarios where you need to enforce consistent governance across multiple environments (e.g., dev, test, prod).
    - [vs. ARM templates]: Can accomplish similar things but **ARM templates are NOT Azure resources**
        - ARM templates usually stored in source control or locally

- **[ARM (Azure Resource Manager) Templates (IaC)]**
    - ARM templates are primarily focused on defining the infrastructure as code (IaC) for deploying Azure resources. They describe the desired state of your resources.
    - Useful for automating resource provisioning, especially when you need to deploy individual resources or resource groups.

- **[Template Specs (ARM Template Specs)]**
    - Template Specs is a new resource type for *storing* ARM templates in a resource group.  The purpose of doing that is to allow more efficient sharing, deployment, and control of the Templates shared within an organization.Use when you want to share and control ARM templates across teams while ensuring security and version management.

**Important**
1. [[AWS to Azure services comparison - Azure Architecture Center \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/architecture/aws-professional/services)
1. [[GitHub - Azure/review-checklists: This repo contains code and examples to operationalize Azure review checklists.]](https://github.com/Azure/review-checklists)
1. [[How to use the Azure Well-Architected Framework documentation - Microsoft Azure Well-Architected Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/well-architected/what-is-well-architected-framework)

**Introductory links from Fast Track**
1. Intro
    1. [**What is an Azure landing zone? - Cloud Adoption Framework \| Microsoft Learn**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/)
        1. A landing zone is a well-architected, multi-account environment that is scalable and secure.
        1. The purpose of an Azure landing zone is to ensure the required "plumbing" is already in place, providing greater agility and compliance with security and governance requirements when applications and workloads are deployed on Azure.
        1. [**Cloud operating models**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/compare)
             1. Operating model comparison
             1. Decentralized operations
             1. Centralized operations
             1. Enterprise operations (most similar to our use case)
        1. [**Azure identity and access for LZs**](https://learn.microsoft.com/en-us/azure/architecture/landing-zones/landing-zone-deploy): recommends five role definitions (Roles)
            1. Azure platform owner
            1. Network management
            1. Security operations
            1. Subscription owner
            1. Application owners (DevOps, AppOps)
        1. **Types of landing zones**
            1. [Platform LZ]: provides centralized services used by workloads
            1. [Application LZ]: environments deployed for the workloads themselves
        1. **Landing zone implementation**
            1. [**2 approaches**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options)
                1. [Start with ALZ accelerator]: Get quickly set up with fully integrated governance, security, and operations from the start
                1. [Customize]: Build up environment with specific needs
    1. [[Landing zone implementation options - Cloud Adoption Framework\| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options)
    1. [[Cloud Adoption Framework enterprise-scale landing zones in Azure - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/implementation)
    1. [[Enterprise-Scale for Azure landing zones - Microsoft Community Hub]](https://techcommunity.microsoft.com/t5/azure-architecture-blog/enterprise-scale-for-azure-landing-zones/ba-p/1576575)
    1. [[When to use Enterprise-Scale? - Microsoft Community Hub]](https://techcommunity.microsoft.com/t5/azure-architecture-blog/when-to-use-enterprise-scale/ba-p/1595710)

1. Deploying ALZ
    1. [[Deploying ALZ · Azure/Enterprise-Scale Wiki ·GitHub]](https://github.com/Azure/Enterprise-Scale/wiki/Deploying-ALZ)
    1. [[GitHub - Azure/review-checklists: This repo contains code and examples to operationalize Azure review checklists.]](https://github.com/Azure/review-checklists)

1. Networking
    1. [[Hub-spoke network topology in Azure - Azure Architecture Center \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/architecture/networking/architecture/hub-spoke?tabs=cli)

**Some links from Fast Track sessions**

1. Containers: Management Groups, Subscriptions, Resource Groups:
    1. [[Azure enterprise scaffold - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/resources/migration-with-enterprise-scaffold#azure-management-groups)
    1. [[Azure enterprise scaffold - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/resources/migration-with-enterprise-scaffold#azure-management-groups)
    1. [[Azure Resource Manager overview - Azure Resource Manager \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview#resource-groups)
1. Role-based Access Control (RBAC)
    1. [[Recommended Azure role-based access control - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/roles)
1. Naming Standards
    1. [[Organize your Azure resources effectively - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources?tabs=NamingStandards)
1. Resource tagging
    1. [[Develop your naming and tagging strategy for Azure resources - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)
1. Azure Policy
    1. [[Resource naming and tagging decision guide - Cloud Adoption Framework \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming-and-tagging-decision-guide)
    1. Precedence order, effects: [[Understand how effects work - Azure Policy \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects)
    1. Effects: [[Understand how effects work - Azure Policy \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects)
    1. Resource locks: [[Protect your Azure resources with a lock - Azure Resource Manager \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json)
1. Cost Management
    1. [[Optimize your cloud investment with Cost Management - Microsoft Cost Management \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-best-practices)[Quickstart - Start using Cost analysis - Microsoft Cost Management \|Microsoft Learn](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/quick-acm-cost-analysis)]
1. Azure Blueprints
    1. [[Overview of Azure Blueprints - Azure Blueprints \| Microsoft Learn]](https://learn.microsoft.com/en-us/azure/governance/blueprints/overview)
