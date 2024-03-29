require 'prawn'
 
module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }
 
  def self.report consumption, generation, month
    # Apenas uma string aleatório para termos um corpo de texto pro contrato
    lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum nulla id dignissim iaculis. Vestibulum a egestas elit, vitae feugiat velit. Vestibulum consectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat. Duis sed magna dignissim, lobortis tortor nec, suscipit velit. Nulla sit amet fringilla nisl. Integer tempor mauris vitae augue lobortis posuere. Ut quis tellus purus. Nullam dolor mauris, egestas varius ligula non, cursus faucibus orci sectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat."
 
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      pdf.text "Agreement", :size => 32, :style => :bold, :align => :center
      # Move 80 PDF points para baixo o cursor
      pdf.move_down 80
      # Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
      pdf.text "#{lorem_ipsum}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 30
      # Escreve o texto com os detalhes que o usuário entrou
      pdf.text "#{consumption}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 10
      # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
      pdf.text "Com o cliente: <b>#{generation}</b> por R$#{month}", :size => 12, :align => :justify, :inline_format => true
      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      pdf.text "Link Para o Manul do Prawn clicável", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
      pdf.render_file('public/report.pdf')
    end
  end
 
  # def self.spending spendings
  #   ## Gráfico 1 ##
 
  #   # Formata os dados para gerar o gráfico (Não se preocupe com isso, apenas saiba que nesse gráfico os dados de label precisa entrar como um hash)
  #   spending_labels = {}
  #   spendings.each_with_index {|s,i| spending_labels[i] = s[0].to_s}
 
  #   # Cria um objeto Gruff (gerador de gráfico)
  #   g = Gruff::AccumulatorBar.new 1000
  #   # Esconde a legenda
  #   g.hide_legend = true
  #   # Escolhe o tamanho da Font
  #   g.marker_font_size = 16
  #   # Escolhe as cores que serão usadas
  #   g.theme = {
  #    :colors => ['#aedaa9', '#12a702'],
  #    :marker_color => '#dddddd',
  #    :font_color => 'black',
  #    :background_colors => 'white'
  #   }
  #   # Aqui nós colocamos os dados y da tabela
  #   g.data 'Savings', spendings.map {|s| s[1]}
  #   # Aqui colocamos os dados que formatamos antes da coluna x
  #   g.labels = spending_labels
  #   # Gera a imagem no diretório público (você pode escolher onde gerar)
  #   g.write('public/graph.jpg')
 
 
  #   ## Gráfico 2 ##
  #   # Estamos colocando nossos dados direto em @datasets para preencher o gráfico 2
  #   @datasets = spendings
  #   # Cria o objeto Gruff
  #   g = Gruff::Pie.new 900
  #   g.theme = Gruff::Themes::PASTEL
 
  #   # Aqui ele formata nossos dados
  #   @datasets.each do |data|
  #     g.data(data[0], data[1])
  #   end
 
  #   # Aqui ele gera a imagem do gráfico
  #   g.write("public/graph_pie.jpg")
 
 
  #   # Inicia nosso PDF
  #   Prawn::Document.new(PDF_OPTIONS) do |pdf|
  #     # Define a cor do traçado
  #     pdf.fill_color "666666"
  #     # Cria um título com tamanho 28 PDF Points, bold alinha no centro
  #     pdf.text "Gráficos de gastos", :size => 28, :style => :bold, :align => :center
  #     # Move 60 PDF points para baixo o cursor
  #     pdf.move_down 60
  #     # Escreve mais um texto sobre o gráfico
  #     pdf.text "Gráfico em R$ de gastos por setor", size: 14, color: 'AAAAAA', align: :center
  #     # Inclui a imagem com o gráfico na escala 0.50 para diminuir pela metade a imagem
  #     pdf.image "public/graph.jpg", :scale => 0.50
  #     # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
  #     pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
  #     # Muda de página para incluir o outro gráfico
  #     pdf.start_new_page
  #     # Move 60 PDF points para baixo o cursor
  #     pdf.move_down 20
  #     # Escreve mais um texto sobre o gráfico
  #     pdf.text "Gráfico em % de gastos por setor", size: 14, color: 'AAAAAA', align: :center
  #     # Incluir o gráfico numero 2
  #     pdf.image "public/graph_pie.jpg", :scale => 0.50
  #     # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
  #     pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
  #     # Gera nosso pdf no diretório public
  #     pdf.render_file('public/spending.pdf')
  #   end
  # end
 
end