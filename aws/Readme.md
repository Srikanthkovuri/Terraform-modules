# TERRAFORM-MODULES
* Terraform modules are a fundamental aspect of Terraform’s infrastructure-as-code approach, allowing you to organize and reuse configurations efficiently.
![alt text](Modules.jpg)
* **Root Module**: Every Terraform configuration has at least one module, known as the root module, which consists of the resources defined in the main working directory.
* In our case : 
    -  **aws**
* **Child Modules**: A root module can call other modules, known as child modules, to include their resources into the configuration. Child modules can be called multiple times within the same configuration.
* In our case :
    - **vpc** 
    - **securitygrp**
    - **autoscalelb**


  
 