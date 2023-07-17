require 'tty-prompt'

# Cria um array para armazenar as tarefas
tarefas = []

# Cria um objeto prompt
prompt = TTY::Prompt.new

# Método para adicionar uma tarefa
def adicionar_tarefa(tarefas, prompt)
  tarefa = prompt.ask('Digite a tarefa:')
  tarefas << tarefa
  puts "Tarefa adicionada: #{tarefa}"
end

# Método para remover uma tarefa
def remover_tarefa(tarefas, prompt)
  tarefa = prompt.select('Selecione uma tarefa para remover:', tarefas)
  tarefas.delete(tarefa)
  puts "Tarefa removida: #{tarefa}"
end

# Método para visualizar as tarefas
def visualizar_tarefas(tarefas)
  if tarefas.empty?
    puts "Nenhuma tarefa cadastrada."
  else
    puts "Lista de tarefas:"
    tarefas.each_with_index { |tarefa, index| puts "#{index + 1}. #{tarefa}" }
  end
end

# Loop principal do programa
loop do
  # Exibe o menu de opções para o usuário
  opcao = prompt.select('Selecione uma opção:', ['Adicionar Tarefa', 'Remover Tarefa', 'Visualizar Tarefas', 'Sair'])

  case opcao
  when 'Adicionar Tarefa'
    adicionar_tarefa(tarefas, prompt)
  when 'Remover Tarefa'
    remover_tarefa(tarefas, prompt)
  when 'Visualizar Tarefas'
    visualizar_tarefas(tarefas)
  when 'Sair'
    break
  end
end
