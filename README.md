# GitHub Action for Pull Request Size

This Action adds size labels on a pull request based on number of additions and deletions.

- `size/XS` - Sum of additions and deletions is less than or equal to 10.
- `size/S` - Sum of additions and deletions is less than or equal to 30.
- `size/M` - Sum of additions and deletions is less than or equal to 100.
- `size/L` - Sum of additions and deletions is less than or equal to 500.
- `size/XL` - Sum of additions and deletions is less than or equal to 1000.
- `size/XXL` - Sum of additions and deletions is greater than 1000.

## Usage

Example workflow:

```hcl
workflow "Pull Request Size" {
  on = "pull_request"
  resolves = ["pull-request-size"]
}

action "pull-request-size" {
  uses = "innovationnorway/github-action-pull-request-size@master"
  secrets = ["GITHUB_TOKEN"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
