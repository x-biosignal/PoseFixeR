# PoseFixeR: R package for preprocessing pose estimation with OpenPose
This package implements workflow of detecting and correcting anomalies that occur during OpenPose gait analysis. 
See Vignette for more details.
https://rpubs.com/matsuilab/PoseFixeR

First, install from the github page with R package `devtools`.

```{r}
library(devtools)
devtools::install_git("https://github.com/x-biosignal/PoseFixeR")
```

Load the library.

```{r}
library(PoseFixeR)
```

## Installation

The ecosystem builds on Bioconductor, so its repositories have to be on the
list as well -- without them the install stops at `SummarizedExperiment`.

```r
install.packages("BiocManager", repos = "https://cloud.r-project.org")
install.packages(
  "PoseFixeR",
  repos = c("https://x-biosignal.r-universe.dev", BiocManager::repositories())
)
```

From GitHub instead:

```r
install.packages("remotes", repos = "https://cloud.r-project.org")
remotes::install_github("x-biosignal/PoseFixeR")
```

