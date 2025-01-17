% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sjPlotClusterAnalysis.R
\name{sjc.cluster}
\alias{sjc.cluster}
\title{Compute hierarchical or kmeans cluster analysis}
\usage{
sjc.cluster(data, groupcount = NULL, method = "h", distance = "euclidean",
  agglomeration = "ward", iter.max = 20, algorithm = "Hartigan-Wong")
}
\arguments{
\item{data}{data frame containing all variables that should be used for the
cluster analysis.}

\item{groupcount}{amount of groups (clusters) that should be retrieved. May also be
a set of initial (distinct) cluster centres, in case \code{method = "kmeans"}
(see \code{\link{kmeans}} for details on \code{centers} argument). 
If \code{groupcount = NULL}, the optimal amount of clusters is calculated using the 
gap statistics (see \code{\link{sjc.kgap}}. However, this works only 
with \code{method = "kmeans"}. If \code{method = "hclust"}, you have 
to specify \code{groupcount}. Following functions 
may be helpful for estimating the amount of clusters:
\itemize{
  \item Use \code{\link{sjc.elbow}} to determine the group-count depending on the elbow-criterion.
  \item If \code{method = "kmeans"}, use \code{\link{sjc.kgap}} to determine the group-count according to the gap-statistic.
  \item If \code{method = "hclust"} (hierarchical clustering, default), use \code{\link{sjc.dend}} to inspect different cluster group solutions.
  \item Use \code{\link{sjc.grpdisc}} to inspect the goodness of grouping (accuracy of classification).
  }}

\item{method}{Indicates the clustering method. If \code{"hclust"} (default), a hierachical 
clustering using the ward method is computed. Use \code{"kmeans"} to compute a k-means clustering.
You can specifiy inital letters only.}

\item{distance}{distance measure to be used when \code{method = "hclust"} (for hierarchical
clustering). Must be one of \code{"euclidean"}, \code{"maximum"}, \code{"manhattan"}, 
\code{"canberra"}, \code{"binary"} or \code{"minkowski"}. See \code{\link{dist}}.
If is \code{method = "kmeans"} this argument will be ignored.}

\item{agglomeration}{agglomeration method to be used when \code{method = "hclust"} (for hierarchical
clustering). This should be one of \code{"ward"}, \code{"single"}, \code{"complete"}, \code{"average"}, 
\code{"mcquitty"}, \code{"median"} or \code{"centroid"}. Default is \code{"ward"} (see \code{\link{hclust}}).
If \code{method = "kmeans"} this argument will be ignored. See 'Note'.}

\item{iter.max}{maximum number of iterations allowed. Only applies, if 
\code{method = "kmeans"}. See \code{\link{kmeans}} for details on this argument.}

\item{algorithm}{algorithm used for calculating kmeans cluster. Only applies, if 
\code{method = "kmeans"}. May be one of \code{"Hartigan-Wong"} (default), 
\code{"Lloyd"} (used by SPSS), or \code{"MacQueen"}. See \code{\link{kmeans}} 
for details on this argument.}
}
\value{
The group classification for each observation as vector. This group
          classification can be used for \code{\link{sjc.grpdisc}}-function to
          check the goodness of classification.
          The returned vector includes missing values, so it can be appended 
          to the original data frame \code{data}.
}
\description{
Compute hierarchical or kmeans cluster analysis and return the group
               association for each observation as vector.
}
\note{
Since R version > 3.0.3, the \code{"ward"} option has been replaced by 
       either \code{"ward.D"} or \code{"ward.D2"}, so you may use one of 
       these values. When using \code{"ward"}, it will be replaced by \code{"ward.D2"}.
       \cr \cr
       To get similar results as in SPSS Quick Cluster function, following points
       have to be considered:
       \enumerate{
         \item Use the \code{/PRINT INITIAL} option for SPSS Quick Cluster to get a table with initial cluster centers.
         \item Create a \code{\link{matrix}} of this table, by consecutively copying the values, one row after another, from the SPSS output into a matrix and specifying \code{nrow} and \code{ncol} arguments.
         \item Use \code{algorithm="Lloyd"}.
         \item Use the same amount of \code{iter.max} both in SPSS and this \code{sjc.qclus}.
       }
       This ensures a fixed initial set of cluster centers (as in SPSS), while \code{\link{kmeans}} in R
       always selects initial cluster sets randomly.
}
\examples{
# Hierarchical clustering of mtcars-dataset
groups <- sjc.cluster(mtcars, 5)

# K-means clustering of mtcars-dataset
groups <- sjc.cluster(mtcars, 5, method="k")

}
\references{
Maechler M, Rousseeuw P, Struyf A, Hubert M, Hornik K (2014) cluster: Cluster Analysis Basics and Extensions. R package.
}

