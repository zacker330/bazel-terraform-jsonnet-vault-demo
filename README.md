# Use jsonnet as Terrform config file
### Terraform tf file:
```hcl
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://127.0.0.1:8200"
}

resource "vault_generic_secret" "example" {
  path = "secret/foo"

  data_json = jsonencode(
    {
      "foo"   = "bar",
      "pizza" = "cheese"
    }
  )
}

resource "vault_generic_secret" "example1" {
  path = "secret/dddd"

  data_json = jsonencode(
    {
      "foo"   = "bar",
      "pizza" = "cheese"
    }
  )
}
```
### jsonnet file
```jsonnet
{
    provider: {
        vault:{
        address: "http://127.0.0.1:8200"
        }
    },
    resource: {
        vault_generic_secret: [{
            example:{
                path: "secret/foo",
//                与下面的对比
                data_json: "{\"a\":12}",
            },
        },
        {
        example1:{
             path: "secret/abc",
             data_json: std.toString(
                { a: "a" }
                ),
         },
         }
        ],
    },
}
```




