output$analyse_lda_fit <- renderUI(
  sidebarLayout(
    sidebarPanel(
      h5("Latent Dirichlet Allocation"),
      sliderInput("lda_ntopics", "Number of Topics", min=1, max=20, value=5),
      selectizeInput("lda_method", "Method", c("Gibbs", "VEM"), "Gibbs"),
      actionButton("lda_button_fit", "Fit"),
      render_helpfile("LDA", "analyse/lda_fit.md")
    ),
    mainPanel(
      textOutput("analyse_lda_fit_")
    )
  )
)

output$analyse_lda_fit_ <- renderText({
  button <- buttonfix(session, input$lda_button_fit)
  
  if (button$lda_button_fit)
  {
    withProgress(message='Fitting the model...', value=0,
    {
      corpus <- get("corpus", envir=session)
      DTM <- qdap::as.dtm(corpus)
      
      lda_mdl <- topicmodels::LDA(DTM, k=input$lda_ntopics, method=input$lda_method)
      assign("lda_mdl", lda_mdl, envir=session)
      
      capture.output(lda_mdl)
    })
  }
  else
    "Press 'Fit' to fit an LDA model."
})



output$analyse_lda_topics <- renderUI(
  sidebarLayout(
    sidebarPanel(
      h5("Latent Dirichlet Allocation"),
      sliderInput("lda_nterms", "Number of Terms", min=1, max=50, value=10),
      actionButton("lda_button_topics", "Update Topics"),
      render_helpfile("LDA", "analyse/lda_topics.md")
    ),
    mainPanel(
      renderTable({
        button <- buttonfix(session, input$lda_button_topics)
        
        if (button$lda_button_topics)
        {
          if (exists("lda_mdl", envir=session))
          {
            lda_mdl <- get("lda_mdl", envir=session)
            topicmodels::terms(lda_mdl, input$lda_nterms)
          }
          else
            stop("You must first fit a model in the 'Fit' tab!")
        }
        else
          data.frame("Fit a model in the 'Fit' tab and then generate topics by clicking the 'Update Topics' button.")
      })
    )
  )
)

