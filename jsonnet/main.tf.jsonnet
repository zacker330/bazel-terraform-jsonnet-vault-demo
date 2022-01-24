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
