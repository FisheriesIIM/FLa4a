#' @title get K 
#' @name getK
#' @rdname getK
#' @description Method to get K values
#' @param object a \code{a4aGr} object
#' @return a \code{vector} with K values
#' @aliases getK getK-methods getK,a4aGr-method
#' @examples
#' mm <- matrix(NA, ncol=3, nrow=3)
#' diag(mm) <- c(50, 0.001,0.001)
#' mm[upper.tri(mm)] <- mm[lower.tri(mm)] <- c(0.1,0.01,0.00004)
#' vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")), vcov=mm, distr="norm")
#' vbObj <- mvrnorm(100,vbObj)
#' getK(vbObj)
setGeneric("getK", function(object, ...) standardGeneric("getK"))
setMethod("getK", "a4aGr", function(object){
	k <- c("k","K")[c("k","K") %in% dimnames(params(object))$params]
	if(length(k)==1) params(object)[k]
}) 

#' @title mvrnorm 
#' @name mvrnorm for a4aGr
#' @rdname mvrnorm-a4aGr
#' @description Method to simulate multivariate normal parameters for \code{a4aGr} objects.
#' @param n the number of simulations to be generated
#' @param mu a \code{a4aGr} object
#' @return a \code{a4aGr} object with n iterations 
#' @aliases mvrnorm,numeric,a4aGr-method mvrnorm,numeric,a4aGr,ANY,ANY,ANY,ANY-method
#' @examples
#' mm <- matrix(NA, ncol=3, nrow=3)
#' diag(mm) <- c(50, 0.001,0.001)
#' mm[upper.tri(mm)] <- mm[lower.tri(mm)] <- c(0.1,0.01,0.00004)
#' vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")), vcov=mm, distr="norm")
#' vbObj <- mvrnorm(100,vbObj)

setMethod("mvrnorm", signature("numeric", "a4aGr"), function(n=1, mu) {
	args <- list()
	args$mu <- FLModelSim(model=grInvMod(mu), params=params(mu), vcov=vcov(mu), distr=distr(mu))
	args$n <- n
	res <- do.call("mvrnorm", args)	
	params(mu) <- params(res)
	mu	
})

#' @title mvrtriangle 
#' @name mvrtriangle for a4aGr 
#' @rdname mvrtriangle-a4aGr
#' @description Method to simulate multivariate parameters with triangle marginals and elliptic copulas for \code{a4aGr} objects.
#'
#' @param n the number of simulations to be generated
#' @param mu a \code{a4aGr} object
#' @return a \code{a4aGr} object with n iterations 
#' @aliases mvrtriangle,numeric,a4aGr-method
#' @examples
#' mm <- matrix(NA, ncol=3, nrow=3)
#' diag(mm) <- c(50, 0.001,0.001)
#' mm[upper.tri(mm)] <- mm[lower.tri(mm)] <- c(0.1,0.01,0.00004)
#' vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")), vcov=mm, distr="norm")
#' pars <- list(list(a=90, b=125, c=120), list(a=0.2, b=0.4), list(a=0, b=0.4, c=0.1))
#' vbObj <- mvrtriangle(10000, vbObj, paramMargins=pars)
#' splom(data.frame(t(params(vbObj)@@.Data)), pch=".")

setMethod("mvrtriangle", signature("numeric", "a4aGr"), function(n=1, object, ...) {
	args <- list(...)
	args$object <- FLModelSim(model=grInvMod(object), params=params(object), vcov=vcov(object), distr=distr(object))
	args$n <- n
	res <- do.call("mvrtriangle", args)	
	params(object) <- params(res)
	object	
})

#' @title mvrcop 
#' @name mvrcop for a4aGr
#' @rdname mvrcop-a4aGr
#' @description Method to simulate model parameters using self defined copulas and margins for \code{a4aGr} objects.
#' @param n the number of iterations
#' @param object the \code{FLModelSim} object
#' @param ... arguments to be passed to the rMvdc and copula methods
#' @return a \code{FLModelSim} object with n groups of parameters
#' @aliases mvrcop,numeric,a4aGr-method
#' @examples
#' mm <- matrix(NA, ncol=3, nrow=3)
#' diag(mm) <- c(50, 0.001,0.001)
#' mm[upper.tri(mm)] <- mm[lower.tri(mm)] <- c(0.1,0.01,0.00004)
#' vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")), vcov=mm, distr="norm")
#' pars <- list(list(a=90, b=125, c=120), list(a=0.2, b=0.4), list(a=0, b=0.4, c=0.1))
#' vbObj <- mvrcop(10000, vbObj, copula="archmCopula", family="clayton", param=2, margins="triangle", paramMargins=pars)
#' splom(data.frame(t(params(vbObj)@@.Data)), pch=".")

setMethod("mvrcop", signature("numeric", "a4aGr"), function(n=1, mvdc, ...) {
	object <- mvdc
	rm(mvdc)
	args <- list(...)
	args$mvdc <- FLModelSim(model=grInvMod(object), params=params(object), vcov=vcov(object), distr=distr(object))
	args$n <- n
	res <- do.call("mvrcop", args)	
	params(object) <- params(res)
	object	
})

#' @title predict for \code{a4aGr} 
#' @name predict for a4aGr
#' @rdname predict-a4aGr
#' @description Predicts age or lengths using a growth class
#' @param object the \code{a4aGr} object
#' @param ... arguments to be passed to the rMvdc and copula methods
#' @return a \code{matrix} object with lengths or ages
#' @aliases predict,a4aGr-method
#' @examples
#' vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")))
#' predict(vbObj, len=1:50+0.5)
#' predict(vbObj, t=1:20+0.5)
#'
setMethod("predict", "a4aGr", function(object, ...){
	model <- object
	args <- list(...)
	ll <- all.vars(grInvMod(object))[!all.vars(grMod(object)) %in% all.vars(grInvMod(object))]
	if(ll %in% names(args)){
		args$object <- FLModelSim(model=grInvMod(model), params=params(model), vcov=vcov(model), distr=distr(model))
	} else {
		args$object <- FLModelSim(model=grMod(model), params=params(model), vcov=vcov(model), distr=distr(model))
	}
	do.call("predict", args)
})



