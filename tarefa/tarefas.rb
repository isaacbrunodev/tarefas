tarefas=[]
loop do
puts"Digite uma tarefa (ou 'sair' para encerrar):"
input=gets.chomp

break if input.downcase=='sair'
tarefas << input
end

puts " Lista de tarefas: "
if tarefas.empty?
puts "Nehuma tarefa cadastrada"
else
    tarefas.each_with_index do |tarefa,index|
    puts "#{index+1}. #{tarefa}"
 end

end