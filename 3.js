function calcularFaturamento(faturamentoDiario) {
    let menorValor = Number.MAX_VALUE;
    let maiorValor = Number.MIN_VALUE;
    let somaFaturamento = 0;
    let diasComFaturamento = 0;

    for (let valor of faturamentoDiario) {
        if (valor > 0) { 
            if (valor < menorValor) {
                menorValor = valor;
            }
            if (valor > maiorValor) {
                maiorValor = valor;
            }
            somaFaturamento += valor;
            diasComFaturamento++;
        }
    }

    let mediaAnual = somaFaturamento / diasComFaturamento;

    let diasAcimaDaMedia = 0;
    for (let valor of faturamentoDiario) {
        if (valor > 0 && valor > mediaAnual) {
            diasAcimaDaMedia++;
        }
    }

    return {
        menorValor: menorValor,
        maiorValor: maiorValor,
        diasAcimaDaMedia: diasAcimaDaMedia
    };
}

const faturamentoDiario = [0, 150, 230, 0, 180, 0, 300, 100, 120, 170, 0, 250]

const resultado = calcularFaturamento(faturamentoDiario);
console.log(`Menor valor de faturamento: ${resultado.menorValor}`);
console.log(`Maior valor de faturamento: ${resultado.maiorValor}`);
console.log(`Número de dias com faturamento acima da média: ${resultado.diasAcimaDaMedia}`);