# tslint action

## Validations on Push

This actions will check Typescript projects using
[tslint](https://github.com/palantir/tslint)

`tslint` requires a `tsconfig.json` to be located on the root of the project,
describing how the Typescript project is organized, and a `tslint.json` file to
define the rules that the linter will follow.

## Fixes on Pull Request review

This action provides automated fixes using Pull Request review comments.

If the comment starts with `fix $action_name` or `fix tslint`, a new commit will
be added to the branch with the automated fixes applied.

**Supports**: autofix on push

## Example workflow

```hcl
workflow "on push" {
  on = "push"
  resolves = ["tslint"]
}

# Used for fix on review
# Don't enable if you plan using autofix on push
# Or there might be race conditions
workflow "on review" {
  resolves = ["tslint"]
  on = "pull_request_review"
}

action "tslint" {
  uses = "bltavares/actions/tslint@master"
  # Enable autofix on push
  # args = ["autofix"]
  # Used for pushing changes for `fix` comments on review
  secrets = ["GITHUB_TOKEN"]
}
```
