# azure-notes

**Azure hierarchy (start to think what this should look like)**

1.  Management Group

    a.  Subscriptions

        i.  Resource Groups

            1.  Resource

 

**Tenant vs. Subscription**

-   A **Tenant** is associated with a single identity (person, company,
    or organization) and can own one or several subscriptions

-   A **Subscription** is linked to a payment setup and each
    subscription will result in a separate bill

-   In every Subscription, you can add virtual resources (VM, storage,
    network, \...)

 

**Azure Advisor vs. Azure Monitor vs. Azure Sentinel**

-   **[Azure Advisor]{.underline}**

    -   Azure Advisor provides personalized recommendations to optimize
        Azure resources for performance, security, reliability,
        and cost-effectiveness.

    -   *Use Azure Advisor when you want to fine-tune your Azure
        resources based on best practices and cost efficiency.*

-   **[Azure Monitor]{.underline}**

    -   Azure Monitor is an operational monitoring solution.

    -   Integration:

        -   Both Azure Sentinel and Defender for Cloud (formerly Azure
            Security Center) use the same agents and Azure Monitor Logs
            workspace for storing monitoring data.

    -   Azure Monitor is largely a free service, but certain categories
        of alert rules and customer-managed data storage incur costs.

-   **[Azure Sentinel]{.underline}**

    -   Azure Sentinel is a **Security Information and Event Management
        (SIEM)** solution for security monitoring, threat detection, and
        incident response capabilities.

    -   Integration with Azure Monitor:

        -   Sentinel and Azure Monitor share the same agents and
            workspace capabilities.Sentinel uses the same Azure Monitor
            Logs workspace for storing its monitoring data.Sentinel
            increases the price of the entire workspace, unlike Azure
            Monitor, which is largely free.

 

**Pricing Calcuator vs. TCO Calculator vs. Cost Management and Billing**

-   **[Pricing Calculator]{.underline}**

    -   The Azure Pricing Calculator **helps you estimate costs for your
        Azure usage**. It allows you to turn anticipated usage into an
        estimated cost, making it easier to plan and budget.

-   **[TCO (Total Cost of Ownership) Calculator]{.underline}**

    -   The TCO Calculator compares costs between an on-premises
        configuration and an Azure setup. It considers both direct and
        indirect costs.

-   **[Cost Management and Billing]{.underline}**Cost Management
    provides tools and insights to **manage and optimize your Azure
    spending**.

 

**VNet peering vs. VNet to VNet connection via VPN Gateway**

-   VNet Peering

-   VNet to VNet connection via VPN Gateway (encrypts traffic)

 

**Azure Blueprints vs. ARM Templates**

-   **[Azure Blueprints]{.underline}**

    -   Azure Blueprints are designed to address the challenge of
        deploying complex environments with multiple components. They
        allow you to package various elements (such as networking,
        security, compliance, and resource configurations) into a single
        reusable definition.

    -   Ideal for scenarios where you need to enforce consistent
        governance across multiple environments (e.g., dev, test, prod).

    -   [vs. ARM templates]{.underline}: Can accomplish similar things
        but **ARM templates are NOT Azure resources**

        -   ARM templates usually stored in source control or locally

-   **[ARM (Azure Resource Manager) Templates (IaC)]{.underline}**

    -   ARM templates are primarily focused on defining the
        infrastructure as code (IaC) for deploying Azure resources. They
        describe the desired state of your resources.

    -   Useful for automating resource provisioning, especially when you
        need to deploy individual resources or resource groups.

-   **[Template Specs (ARM Template Specs)]{.underline}**

> Template Specs is a new resource type for *storing* ARM templates in a
> resource group.  The purpose of doing that is to allow more efficient
> sharing, deployment, and control of the Templates shared within an
> organization.Use when you want to share and control ARM templates
> across teams while ensuring security and version management.

**Important**

1.  [[AWS to Azure services comparison - Azure Architecture Center \|
    Microsoft
    Learn]{.underline}](https://learn.microsoft.com/en-us/azure/architecture/aws-professional/services)

2.  [[GitHub - Azure/review-checklists: This repo contains code and
    examples to operationalize Azure review
    checklists.]{.underline}](https://github.com/Azure/review-checklists)

3.  [[How to use the Azure Well-Architected Framework documentation -
    Microsoft Azure Well-Architected Framework \| Microsoft
    Learn]{.underline}](https://learn.microsoft.com/en-us/azure/well-architected/what-is-well-architected-framework)

 

**Introductory links from Fast Track**

1.  Intro

    a.  [**What is an Azure landing zone? - Cloud Adoption Framework \|
        Microsoft
        Learn**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/)

        i.  A landing zone is a well-architected, multi-account
            environment that is scalable and secure.

        ii. The purpose of an Azure landing zone is to ensure the
            required "plumbing" is already in place, providing greater
            agility and compliance with security and governance
            requirements when applications and workloads are deployed on
            Azure.

        iii. [**Cloud operating
             models**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/compare)

             1.  Operating model comparison

             2.  Decentralized operations

             3.  Centralized operations

             4.  Enterprise operations (most similar to our use case)

        iv. [**Azure identity and access for
            LZs**](https://learn.microsoft.com/en-us/azure/architecture/landing-zones/landing-zone-deploy):
            recommends five role definitions (Roles)

            1.  Azure platform owner

            2.  Network management

            3.  Security operations

            4.  Subscription owner

            5.  Application owners (DevOps, AppOps)

        v.  **Types of landing zones**

            1.  [Platform LZ]{.underline}: provides centralized services
                used by workloads

            2.  [Application LZ]{.underline}: environments deployed for
                the workloads themselves

        vi. **Landing zone implementation**

            1.  [**2
                approaches**](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options)

                a.  [Start with ALZ accelerator]{.underline}: Get
                    quickly set up with fully integrated governance,
                    security, and operations from the start

                b.  [Customize]{.underline}: Build up environment with
                    specific needs

    b.  [[Landing zone implementation options - Cloud Adoption Framework
        \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options)

    c.  [[Cloud Adoption Framework enterprise-scale landing zones in
        Azure - Cloud Adoption Framework \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/implementation)

    d.  [[Enterprise-Scale for Azure landing zones - Microsoft Community
        Hub]{.underline}](https://techcommunity.microsoft.com/t5/azure-architecture-blog/enterprise-scale-for-azure-landing-zones/ba-p/1576575)

    e.  [[When to use Enterprise-Scale? - Microsoft Community
        Hub]{.underline}](https://techcommunity.microsoft.com/t5/azure-architecture-blog/when-to-use-enterprise-scale/ba-p/1595710)

2.  Deploying ALZ

    a.  [[Deploying ALZ · Azure/Enterprise-Scale Wiki ·
        GitHub]{.underline}](https://github.com/Azure/Enterprise-Scale/wiki/Deploying-ALZ)

    b.  [[GitHub - Azure/review-checklists: This repo contains code and
        examples to operationalize Azure review
        checklists.]{.underline}](https://github.com/Azure/review-checklists)

3.  Networking

    a.  [[Hub-spoke network topology in Azure - Azure Architecture
        Center \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/architecture/networking/architecture/hub-spoke?tabs=cli)

 

**Some links from Fast Track sessions**

1.  Containers: Management Groups, Subscriptions, Resource Groups:

    a.  [[Azure enterprise scaffold - Cloud Adoption Framework \|
        Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/resources/migration-with-enterprise-scaffold#azure-management-groups)

    b.  [[Azure enterprise scaffold - Cloud Adoption Framework \|
        Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/resources/migration-with-enterprise-scaffold#azure-management-groups)

    c.  [[Azure Resource Manager overview - Azure Resource Manager \|
        Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview#resource-groups)

2.  Role-based Access Control (RBAC)

    a.  [[Recommended Azure role-based access control - Cloud Adoption
        Framework \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/roles)

3.  Naming Standards

    a.  [[Organize your Azure resources effectively - Cloud Adoption
        Framework \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources?tabs=NamingStandards)

4.  Resource tagging

    a.  [[Develop your naming and tagging strategy for Azure resources -
        Cloud Adoption Framework \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

5.  Azure Policy

    a.  [[Resource naming and tagging decision guide - Cloud Adoption
        Framework \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming-and-tagging-decision-guide)

    b.  Precedence order, effects: [[Understand how effects work - Azure
        Policy \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects)

    c.  Effects: [[Understand how effects work - Azure Policy \|
        Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects)

    d.  Resource locks: [[Protect your Azure resources with a lock -
        Azure Resource Manager \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json)

6.  Cost Management

    a.  [[Optimize your cloud investment with Cost Management -
        Microsoft Cost Management \| Microsoft
        Learn](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-best-practices)[Quickstart -
        Start using Cost analysis - Microsoft Cost Management \|
        Microsoft
        Learn](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/quick-acm-cost-analysis)]{.underline}

7.  Azure Blueprints

    a.  [[Overview of Azure Blueprints - Azure Blueprints \| Microsoft
        Learn]{.underline}](https://learn.microsoft.com/en-us/azure/governance/blueprints/overview)
