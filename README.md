# Teste-de-SQL-Questao-1

Dadas as 3 tabelas:

- students: (id int, name text, enrolled_at date, course_id text)
- courses: (id int, name text, price numeric, school_id text)
- schools: (id int, name text)
Considere que todos alunos se matricularam nos respectivos cursos e que price é o valor da matrícula, pago por cada aluno.



a. Escreva uma consulta PostgreSQL para obter, por nome da escola e por dia, a quantidade de alunos matriculados e o valor total das matrículas, tendo como restrição os cursos que começam com a palavra “data”. Ordene o resultado do dia mais recente para o mais antigo.

b.Utilizando a resposta do item a, escreva uma consulta para obter, por escola e por dia, a soma acumulada, a média móvel 7 dias e a média móvel 30 dias da quantidade de alunos.
