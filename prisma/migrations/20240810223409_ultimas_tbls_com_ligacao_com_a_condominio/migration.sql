-- CreateTable
CREATE TABLE "blocos" (
    "id" TEXT NOT NULL,
    "sigla" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "blocos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pessoas" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "numeroEnd" TEXT NOT NULL,
    "complementoEnd" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "Pessoas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Periodos" (
    "id" TEXT NOT NULL,
    "inicio" TEXT NOT NULL,
    "fim" TEXT NOT NULL,
    "encerramento" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "Periodos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categoria" (
    "id" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "nivel" TEXT NOT NULL,
    "ordem" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "categoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conta" (
    "id" TEXT NOT NULL,
    "sigla" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "saldoInicial" TEXT NOT NULL,
    "SaldoAtual" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "conta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cobrancas" (
    "id" TEXT NOT NULL,
    "motivoEmissao" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "parcela" TEXT NOT NULL,
    "dataEmissao" TIMESTAMP(3) NOT NULL,
    "dataVencimento" TIMESTAMP(3) NOT NULL,
    "valor" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "desconto" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "abatimento" TEXT NOT NULL,
    "outrasDeducoes" TEXT NOT NULL,
    "jurosMora" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "multa" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "outrosAcrescimos" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "total" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "descricao" TEXT NOT NULL,
    "percentualJurosMes" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "percentualMulta" DECIMAL(65,30) NOT NULL DEFAULT 10.2,
    "situacao" BOOLEAN NOT NULL,
    "dataRecebimento" TIMESTAMP(3) NOT NULL,
    "motivoBaixa" TEXT NOT NULL,
    "condominio_id" TEXT NOT NULL,

    CONSTRAINT "cobrancas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "conta_condominio_id_key" ON "conta"("condominio_id");

-- AddForeignKey
ALTER TABLE "blocos" ADD CONSTRAINT "blocos_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoas" ADD CONSTRAINT "Pessoas_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Periodos" ADD CONSTRAINT "Periodos_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoria" ADD CONSTRAINT "categoria_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conta" ADD CONSTRAINT "conta_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cobrancas" ADD CONSTRAINT "cobrancas_condominio_id_fkey" FOREIGN KEY ("condominio_id") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
