% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ModelSeries_fitModels2.R
\name{fitEnsembleModel}
\alias{fitEnsembleModel}
\title{fitEnsembleModel}
\usage{
fitEnsembleModel(
  Xs,
  Ys,
  geneSet = NULL,
  na.fill.method = c("quantile", "rpart", NULL)[1],
  na.fill.seed = 2022,
  n = 20,
  sampSize = 0.7,
  sampSeed = 2020,
  breakVec = c(0, 0.25, 0.5, 0.75, 1),
  params = list(max_depth = 5, eta = 0.5, nrounds = 100, nthread = 5, nfold = 5),
  caret.grid = NULL,
  caret.seed = 101,
  ptail = 0.5,
  verbose = F,
  numCores = 2
)
}
\arguments{
\item{Xs}{Gene expression matrix.}

\item{Ys}{Phenotype vector, multiclass}

\item{geneSet}{A list of genes for classification}

\item{na.fill.method}{Missing value imputation method for \code{\link{na_fill}} function. One of \code{'quantile'}, \code{'rpart'} and \code{NULL}.}

\item{na.fill.seed}{Seed for \code{\link{na_fill}} function.}

\item{n}{Size of the ensember, where each member is a result from
fitSubtypeModel}

\item{sampSize}{proportion of samples to hold back}

\item{sampSeed}{random seed for subset of Xs}

\item{breakVec}{vector of break points, used to bin expression data}

\item{params}{The parameters for \code{\link[xgboost]{xgb.train}}}

\item{caret.seed}{The random seed for caret::train process when \code{params} is \code{NULL}}

\item{ptail}{Binary phenotype vector.}

\item{verbose}{whether report modeling process}

\item{numCores}{number of cores to use, one per ensemble member}
}
\value{
A list of lists of xgboost classifiers
}
\description{
Train multiple subtype models using cross validation
}
\details{
The geneid of \code{geneSet} and \code{Xs} must be the same (one of
  ENSEMBL, SYMBOL or ENTREZID). In addition, if \code{fitEnsembleModel} is hanged on, please check the space use of \code{/}, which would disturb the work of \code{\link[parallel]{makeCluster}}.
}
