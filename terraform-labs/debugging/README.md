# Terraform Debugging

### Set Log Level to Trace

```export TF_LOG = "TRACE"```

### Set Log Path
```export TF_LOG_PATH = "tf-debugging-file.txt"```


### Discourage Terraform from cehcking version
```
dev_overrides {
  "hashicorp/null" = "/home/developer/tmp/terraform-null"
}
```

### Plugin cache
```plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"```

### Provider Alternative Installation
change the default installation 
```
provider_installation {
        filesystem_mirror {
            path    = "/usr/share/terraform/providers"
            include = ["example.com/*/*"]
    }
    direct {
        exclude = ["example.com/*/*"]
  }
}
```
