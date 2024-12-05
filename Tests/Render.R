write_report <- function(results_ls,
                         consent_1L_chr = "",
                         consent_indcs_int = 1L,
                         markdown_dir_1L_chr = character(0),
                         mkdn_source_dir_1L_chr = NA_character_,
                         options_chr = c("Y", "N"),
                         output_dir_1L_chr = character(0)){
  if(identical(markdown_dir_1L_chr, character(0))|identical(output_dir_1L_chr, character(0))){
    temp_dir_1L_chr <- tempdir()
    if(identical(markdown_dir_1L_chr, character(0))){
      markdown_dir_1L_chr <- paste0(temp_dir_1L_chr, "/Markdown")
    }
    if(identical(output_dir_1L_chr, character(0))){
      output_dir_1L_chr <- paste0(temp_dir_1L_chr, "/Output")
    }
  }
  X <- ready4show::Ready4showSynopsis(background_1L_chr = "The data reported in this document is entirely fictional.",
                                      coi_1L_chr = "None declared.",
                                      conclusion_1L_chr = "These fake results are not to be used to inform decision making.",
                                      digits_int = 3L,
                                      ethics_1L_chr = "No ethics approval has been received for the work summarised in this report.",
                                      funding_1L_chr = "No funding information is available for this report.",
                                      interval_chr = NA_character_,
                                      keywords_chr = c("entirely","fake","do", "not","cite"),
                                      outp_formats_chr = "PDF",
                                      sample_desc_1L_chr = NA_character_,
                                      title_1L_chr = "A hypothetical report from the avert compuational model")
  X <- renewSlot(X,
                 "authors_r3",
                 first_nm_chr = "Anonymous",
                 middle_nm_chr = "",
                 last_nm_chr = "Author",
                 title_chr = "",
                 qualifications_chr = "",
                 institute_chr = "Institute_A",
                 sequence_int = 1,
                 is_corresponding_lgl = T,
                 email_chr = "fake_email@fake_institute.com")  
  X <- renewSlot(X,
                 "institutes_r3", short_name_chr = "Institute_A", long_name_chr = "Anonymous Institute") 
  #
 X <- renewSlot(X,"a_Ready4showPaths@outp_data_dir_1L_chr",
              temp_dir_1L_chr)
 X <- renewSlot(X, "a_Ready4showPaths@mkdn_source_dir_1L_chr", mkdn_source_dir_1L_chr)
  authorData(X,
             consent_1L_chr = consent_1L_chr,
             consent_indcs_int = consent_indcs_int,
             options_chr = options_chr,
             tmpl_url_1L_chr = "https://github.com/avertableburden/avert_report",
             tmpl_version_1L_chr = "0.1.2",
             what_1L_chr = "Manuscript")
  authorReport(X, consent_1L_chr = consent_1L_chr, args_ls = list(Y=results_ls))
}
avert::write_report(avert::get_input_data(), consent_1L_chr = "Y", mkdn_source_dir_1L_chr = getwd())
# X <- renewSlot(X,"a_Ready4showPaths@outp_data_dir_1L_chr",
#                "Tests")
# authorData(X,
#            consent_1L_chr = consent_1L_chr,
#            consent_indcs_int = consent_indcs_int,
#            options_chr = options_chr,
#            tmpl_url_1L_chr = "",
#            tmpl_version_1L_chr = "",
#            what_1L_chr = "Manuscript")
# 
# x<-X
# library(ready4show)
# header_yaml_args_ls <- make_header_yaml_args_ls(x@authors_r3,
#                                                 institutes_tb = x@institutes_r3,
#                                                 keywords_chr = x@keywords_chr,
#                                                 title_1L_chr = x@title_1L_chr)
# write_header_fls(path_to_header_dir_1L_chr = paste0("Tests/Markdown",
#                                                     "/Header"),
#                  header_yaml_args_ls = header_yaml_args_ls,
#                  abstract_args_ls = x@abstract_args_ls,
#                  consent_1L_chr = consent_1L_chr,
#                  consent_indcs_int = consent_indcs_int,
#                  options_chr = options_chr)
# rmarkdown::render(input = "Tests/Markdown/Parent_PDF/Test.Rmd",
#                   output_format = NULL,
#                   params = list(X=X),
#                   output_file = "Report.pdf",
#                   output_dir = "Tests/Report")
