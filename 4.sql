-- Não achei um site rapido pra fazer o mapeamento via imagem, então fiz via SQL mesmo

CREATE TABLE Clientes (
    Cliente_Id INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(255) NOT NULL,                
    Estado_Id INT,                             
    CONSTRAINT FK_Clientes_Estado FOREIGN KEY (Estado_Id) REFERENCES Estados(Estado_Id)
);

CREATE TABLE Telefones (
    Telefone_Id INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_Id INT,                             
    Numero VARCHAR(20) NOT NULL,                
    Tipo_Id INT,                                
    CONSTRAINT FK_Telefones_Cliente FOREIGN KEY (Cliente_Id) REFERENCES Clientes(Cliente_Id),
    CONSTRAINT FK_Telefones_Tipo FOREIGN KEY (Tipo_Id) REFERENCES TiposTelefone(Tipo_Id)
);
CREATE TABLE TiposTelefone (
    Tipo_Id INT AUTO_INCREMENT PRIMARY KEY,  
    Descricao VARCHAR(50) NOT NULL           
);

CREATE TABLE Estados (
    Estado_Id INT AUTO_INCREMENT PRIMARY KEY,  
    Nome VARCHAR(50) NOT NULL,                 
    Sigla CHAR(2) NOT NULL                     
);


SELECT 
    c.Cliente_Id, 
    c.Nome AS RazaoSocial, 
    t.Numero AS Telefone, 
    tt.Descricao AS TipoTelefone
FROM 
    Clientes c
JOIN 
    Telefones t ON c.Cliente_Id = t.Cliente_Id
JOIN 
    TiposTelefone tt ON t.Tipo_Id = tt.Tipo_Id
JOIN 
    Estados e ON c.Estado_Id = e.Estado_Id
WHERE 
    e.Sigla = 'SP';



