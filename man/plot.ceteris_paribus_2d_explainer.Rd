% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_ceteris_paribus_2d.R
\name{plot.ceteris_paribus_2d_explainer}
\alias{plot.ceteris_paribus_2d_explainer}
\title{Plot Ceteris Paribus 2D Explanations}
\usage{
\method{plot}{ceteris_paribus_2d_explainer}(
  x,
  ...,
  facet_ncol = NULL,
  add_raster = TRUE,
  add_contour = TRUE,
  bins = 3,
  add_observation = TRUE,
  pch = "+",
  size = 6
)
}
\arguments{
\item{x}{a ceteris paribus explainer produced with the \code{ceteris_paribus_2d()} function}

\item{...}{currently will be ignored}

\item{facet_ncol}{number of columns for the \code{\link[ggplot2]{facet_wrap}}}

\item{add_raster}{if \code{TRUE} then \code{geom_raster} will be added to present levels with diverging colors}

\item{add_contour}{if \code{TRUE} then \code{geom_contour} will be added to present contours}

\item{bins}{number of contours to be added}

\item{add_observation}{if \code{TRUE} then \code{geom_point} will be added to present observation that is explained}

\item{pch}{character, symbol used to plot observations}

\item{size}{numeric, size of individual datapoints}
}
\value{
a \code{ggplot2} object
}
\description{
This function plots What-If Plots for a single prediction / observation.
}
\examples{
library("DALEX")
library("randomForest")

\donttest{
apartments_rf_model <- randomForest(m2.price ~., data = apartments)

explainer_rf <- explain(apartments_rf_model,
                        data = apartments_test[,-1],
                        y = apartments_test[,1],
                        verbose = FALSE)

new_apartment <- apartments_test[1,]
new_apartment

wi_rf_2d <- ceteris_paribus_2d(explainer_rf, observation = new_apartment)
head(wi_rf_2d)

plot(wi_rf_2d)
plot(wi_rf_2d, add_contour = FALSE)
plot(wi_rf_2d, add_observation = FALSE)
plot(wi_rf_2d, add_raster = FALSE)

# HR data
model <- randomForest(status ~ gender + age + hours + evaluation + salary, data = HR)

pred1 <- function(m, x)   predict(m, x, type = "prob")[,1]

explainer_rf_fired <- explain(model,
                              data = HR[,1:5],
                              y = HR$status == "fired",
                              predict_function = pred1,
                              label = "fired")
new_emp <- HR[1,]
new_emp

wi_rf_2d <- ceteris_paribus_2d(explainer_rf_fired, observation = new_emp)
head(wi_rf_2d)

plot(wi_rf_2d)
}

}
\references{
Explanatory Model Analysis. Explore, Explain and Examine Predictive Models. \url{https://pbiecek.github.io/ema}
}
