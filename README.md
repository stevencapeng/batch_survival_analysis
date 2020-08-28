# batch_survival_analysis in R language
This tiny project was performed in order to dig out the lncRNAs(long non coding RNA) which are significantly related to the prognosis of UCEC(uterine corpus endometrium carcinoma).

The required datasets were listed below all of which were download from TCGA(https://cancergenome.nih.gov)

1:data-TCGA-UCEC-rnaexpr.tsv (expression level of 12727 lncRNAs in tumor tissues)
2:patient-info.txt (characteristics of patients including age, grade, tumor stage, histological subtype)
3:gene-info.txt

We preprocessed raw data with Perl scripts. Survival analysis was conducted with the R package survival(https://cran.r-project.org/web/packages/survival/index.html). 

The executive code is present in src.txt.
