#conda activate r-env
library(rMVP)
data <- read.table("covariates.txt", header = TRUE, sep = "\t")  # Adjust the path accordingly
genotype <- attach.big.matrix("mvp.geno.desc")
phenotype <- read.table("mvp.phe",head=TRUE)
map <- read.table("mvp.geno.map" , head = TRUE)
Covariates <- model.matrix(~as.factor(Rep_Location)+as.numeric(Year), data=data)

fMVP <- MVP(
                phe=phenotype,
                    geno=genotype,
                    map=map,
                        #K=Kinship,
                        #CV.GLM=Covariates,     ##if you have additional covariates, please keep there open.
                        CV.MLM=Covariates,
                        CV.FarmCPU=Covariates,
                        #nPC.GLM=5,      ##if you have added PC into covariates, please keep there closed.
                        nPC.MLM=3,
                            nPC.FarmCPU=3,
                            priority="speed",       ##for Kinship construction
                                #ncpus=10,
                                vc.method="EMMA",      ##only works for MLM
                                maxLoop=10,
                                    method.bin="static",      ## "FaST-LMM", "static" (#only works for FarmCPU)
                                    #permutation.threshold=TRUE,
                                    #permutation.rep=100,
                                    threshold=0.05,
                                        method=c("MLM","FarmCPU"),
                                        out="dtf"
                                        )
#
