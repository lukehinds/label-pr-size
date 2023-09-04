# Label PR Size


# Features
* Automatically labels pull requests with small, medium, or large based on the number of lines changed.
* Uses GitHub Actions to automatically run on new or updated pull requests.

# Usage

To use this action in your project, add the following to your `.github/workflows/pr_size_labeler.yml`:

```yml
name: PR Size Labeler

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  labeler:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: PR Size Labeler
      uses: lukehinds/pr-size-labeler@v1.0.0
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
```

# Configuration

The action currently labels PRs as:

* small: Less than 10 lines changed.
* medium: Between 10 and 100 lines changed.
* large: More than 100 lines changed.

Please create these labels in your repository before using this action.

# Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

This is pretty simple for now, if folks would like configuration options or
other features, please open an issue and we can discuss.
