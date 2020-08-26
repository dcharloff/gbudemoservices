## This configuration was generated by terraform-provider-oci

#data "oci_tenancy" {
#    tenancy_ocid="${var.tenancy_ocid}"
#}

data oci_identity_identity_providers OracleIdentityCloudService {
  compartment_id = "${var.tenancy_ocid}"
  protocol = "SAML2"
}

resource oci_identity_compartment GBUb {
  compartment_id = "${var.tenancy_ocid}"
  description = "GBUb"
  name = "GBUb"
}

resource oci_identity_dynamic_group TIMS-oSSHb {
  compartment_id = "${var.tenancy_ocid}"
  description = "TIMS-oSSHb"
  freeform_tags = {}
  matching_rule = "any {instance.compartment.id = /*/}"
  name          = "TIMS-oSSHb"
}

resource oci_identity_group GBUb {
  compartment_id = "${var.tenancy_ocid}"
  description = "GBUb"
  freeform_tags = {}
  name = "GBUb"
}


resource oci_identity_idp_group_mapping OracleIdentityCloudService_idp_group_mapping_7 {
  group_id             = "${oci_identity_group.GBUb.id}"
  identity_provider_id = "${data.oci_identity_identity_providers.OracleIdentityCloudService.identity_providers[0].id}"
  idp_group_name       = "GBUb"
}

resource oci_identity_policy GBU_Policyb {
  compartment_id = "${var.tenancy_ocid}"
  description = "GBU_Policyb"
  freeform_tags = {
  }
  name = "GBU_Policyb"
  statements = [
    "allow group GBU to manage all-resources in compartment GBU",
    "allow group GBU to use tag-namespaces in tenancy",
    "allow group GBU to manage repos in tenancy",
  ]
}

resource oci_identity_policy TIMS-oSSHb {
  compartment_id = var.tenancy_ocid
  description = "TIMS-oSSHb"
  freeform_tags = {
  }
  name = "TIMS-oSSHb"
  statements = [
    "allow dynamic-group TIMS-oSSH to inspect users in tenancy",
    "allow dynamic-group TIMS-oSSH to inspect groups in tenancy",
    "allow dynamic-group TIMS-oSSH to inspect identity-providers in tenancy",
  ]
}
resource oci_identity_policy TIMS-oSSH-Usersb {
  compartment_id = var.tenancy_ocid
  description = "TIMS-oSSH-Usersb"
  freeform_tags = {
  }
  name = "TIMS-oSSH-Usersb"
  statements = [
    "allow group GBU to manage instances in compartment GBU",
    "allow group GBU to use instances in compartment GBU",
  ]
}

output "oci_identity_policy" {
  description = "TIMS-oSSH-Usersb Policy"
  value = oci_identity_policy.TIMS-oSSH-Usersb.id
  #value = oci_identity_policy.TIMS-oSSHb.id
}

output "oci_identity_compartment" {
  description = "compartment" 
  value = oci_identity_compartment.GBUb.id 
}

output "oci_identity_identity_provider" {
  description = "idp"
  value = data.oci_identity_identity_providers.OracleIdentityCloudService.identity_providers[0].id  
  #value = data.oci_identity_identity_providers.OracleIdentityCloudService.name
}


