terraform { 
  cloud { 
    
    organization = "SJTestOrganization" 

    workspaces { 
      name = "dev1" 
    } 
  } 
}
