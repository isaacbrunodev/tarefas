require 'gtk3'

tarefas = []

def exibir_lista(tarefas)
  if tarefas.empty?
    "Nenhuma tarefa cadastrada."
  else
    tarefas.each_with_index.map { |tarefa, index| "#{index + 1}. #{tarefa}" }.join("\n")
  end
end

# Cria a janela principal
window = Gtk::Window.new("Lista de Tarefas")
window.set_default_size(300, 200)

# Cria uma caixa vertical para organizar os componentes
vbox = Gtk::Box.new(:vertical, 5)
window.add(vbox)

# Cria uma entrada de texto para o usuário digitar a tarefa
entry = Gtk::Entry.new
vbox.pack_start(entry, expand: false, fill: false, padding: 10)

# Cria um botão para adicionar a tarefa à lista
button = Gtk::Button.new(label: "Adicionar Tarefa")
vbox.pack_start(button, expand: false, fill: false, padding: 10)

# Cria uma caixa de texto para exibir a lista de tarefas
textview = Gtk::TextView.new
textview.editable = false
textview.buffer.text = exibir_lista(tarefas)
vbox.pack_start(textview, expand: true, fill: true, padding: 10)

# Conecta o evento de clique do botão para adicionar a tarefa
button.signal_connect("clicked") do
  tarefa = entry.text.strip
  unless tarefa.empty?
    tarefas << tarefa
    textview.buffer.text = exibir_lista(tarefas)
    entry.text = ""
  end
end

# Conecta o evento de fechar a janela
window.signal_connect("destroy") do
  Gtk.main_quit
end

# Exibe a janela
window.show_all

# Inicia o loop principal do GTK
Gtk.main
