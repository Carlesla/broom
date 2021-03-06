% Generated by roxygen2 (4.0.2): do not edit by hand
\name{rowwise_df_tidiers}
\alias{augment.rowwise_df}
\alias{augment_.rowwise_df}
\alias{glance.rowwise_df}
\alias{glance_.rowwise_df}
\alias{rowwise_df_tidiers}
\alias{tidy.rowwise_df}
\alias{tidy_.rowwise_df}
\title{Tidying methods for rowwise_dfs from dplyr, for tidying each row and
recombining the results}
\usage{
\method{tidy}{rowwise_df}(x, data, ...)

\method{tidy_}{rowwise_df}(x, data, ...)

\method{augment}{rowwise_df}(x, data, ...)

\method{augment_}{rowwise_df}(x, data, ...)

\method{glance}{rowwise_df}(x, data, ...)

\method{glance_}{rowwise_df}(x, data, ...)
}
\arguments{
\item{x}{a rowwise_df}

\item{data}{the column name of the column containing the models to
be tidied. For tidy, augment, and glance it should be the bare name; for
_ methods it should be quoted. Note that this argument is named \code{data}
so as to be consistent with the \code{augment} generic.}

\item{...}{additional arguments to pass on to the respective tidying method}
}
\value{
A \code{"grouped_df"}, where the non-list columns of the
original are used as grouping columns alongside the tidied outputs.
}
\description{
These \code{tidy}, \code{augment} and \code{glance} methods are for
performing tidying on each row of a rowwise data frame created by dplyr's
\code{group_by} and \code{do} operations. They first group a rowwise data
frame based on all columns that are not lists, then perform the tidying
operation on the specified column. This greatly shortens a common idiom
of extracting tidy/augment/glance outputs after a do statement.
}
\details{
Note that this functionality is currently implemented for
data.tables, since the result of the do operation is difficult to
distinguish from a regular data.table.
}
\examples{
library(dplyr)
regressions <- mtcars \%>\% group_by(cyl) \%>\% do(mod = lm(mpg ~ wt, .))
regressions

regressions \%>\% tidy(mod)
regressions \%>\% augment(mod)
regressions \%>\% glance(mod)

# we can provide additional arguments to the tidying function
regressions \%>\% tidy(mod, conf.int = TRUE)
}

