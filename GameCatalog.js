let xsltProcessor;
let xmlDoc;

const initialize = async () => {
  const xmlDocPath = "GameCatalog.xml";
  const xslDocPath = "GameCatalog.xsl";

  const parser = new DOMParser();
  xsltProcessor = new XSLTProcessor();

  const xslResponse = await fetch(xslDocPath);
  const xslText = await xslResponse.text();
  const xslStylesheet = parser.parseFromString(xslText, "application/xml");
  xsltProcessor.importStylesheet(xslStylesheet);

  const xmlResponse = await fetch(xmlDocPath);
  const xmlText = await xmlResponse.text();
  xmlDoc = parser.parseFromString(xmlText, "application/xml");
};

function applyXSLT(sortKey = "") {
  xsltProcessor.clearParameters();
  xsltProcessor.setParameter(null, "sortKey", sortKey);
  const result = xsltProcessor.transformToFragment(xmlDoc, document);
  document.getElementById("content").innerHTML = "";
  document.getElementById("content").appendChild(result);
}

function sortGames(key) {
  applyXSLT(key);
}

window.onload = initialize;