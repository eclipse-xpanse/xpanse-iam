domain                             = "localhost"
insecure                           = "true"
port                               = "8088"
xpanse-ui_base_uri                 = "http://localhost:3000"
xpanse_swagger-ui_base_uri         = "http://localhost:8080"
terraform-boot_swagger-ui_base_uri = "http://localhost:9090"
tofu-maker_swagger-ui_base_uri     = "http://localhost:9092"
auth_token_type                    = "JWT"
jwt_profile_file                   = "zitadel-admin-sa.json"
is_local_dev_env                   = true
test_users = [
  {
    "name" : "test-user",
    "email" : "test-user@localhost.com",
    "password" : "Zitadel@123",
    "roles" : [
      "isv",
      "admin",
      "csp",
      "user"
    ],
    "meta-data" : [
      {
        "key" : "csp",
        "value" : "HuaweiCloud"
      },
      {
        "key" : "isv",
        "value" : "ISV-A"
      }
    ]
  },
  {
    "name" : "openstack-lab-csp",
    "email" : "openstacklab@localhost.com",
    "password" : "Zitadel@123",
    "roles" : [
      "csp"
    ],
    "meta-data" : [
      {
        "key" : "csp",
        "value" : "OpenstackTestlab"
      }
    ]
  },
  {
    "name" : "flexible-engine-csp",
    "email" : "flexible-engine@localhost.com",
    "password" : "Zitadel@123",
    "roles" : [
      "csp"
    ],
    "meta-data" : [
      {
        "key" : "csp",
        "value" : "FlexibleEngine"
      }
    ]
  },
  {
    "name" : "plus-server-csp",
    "email" : "plus-server@localhost.com",
    "password" : "Zitadel@123",
    "roles" : [
      "csp"
    ],
    "meta-data" : [
      {
        "key" : "csp",
        "value" : "PlusServer"
      }
    ]
  },
  {
    "name" : "regio-cloud-csp",
    "email" : "regio-cloud@localhost.com",
    "password" : "Zitadel@123",
    "roles" : [
      "csp"
    ],
    "meta-data" : [
      {
        "key" : "csp",
        "value" : "RegioCloud"
      }
    ]
  }
]