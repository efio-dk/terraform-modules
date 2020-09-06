# Static site hosting resources
Example of usage:
```
module "site" {
  source                    = "git@github.com:efio-dk/terraform-modules/aws/static-site-hosting.git"
  region                    = "us-east-1"
  fqdn                      = ["example.efio.dk", "subsite.efio.dk"]
  domain                    = "efio.dk"
  bucket                    = "efio-example-website"
  cloudfront_dist_comment   = "Efio terraform modules!"
  cloudfront_origin_comment = "Efio terraform modules!"
  environment               = "demo"
}
```
