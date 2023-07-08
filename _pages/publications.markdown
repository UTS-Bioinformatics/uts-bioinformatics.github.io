---
layout: page
title: Publications
permalink: /publications/
---

<div id="rss_publications">Loading publications...</div>

<script language="javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script language="javascript">
const RSS_URL = `https://pubmed.ncbi.nlm.nih.gov/rss/search/1jg5TR3me1-AQcjEV_LglX9OF_1RiDNUAa980NE2UvfB6u_EW7/?limit=15&utm_campaign=pubmed-2&fc=20220915092739`;

$.ajax(RSS_URL, {
  accepts: {
    xml: "application/rss+xml"
  },

  dataType: "xml",

  success: function(data) {
    $(data)
      .find("item")
      .each(function() {
        const el = $(this);

        const template = `
          <article>
            <img src="${el.find("link").text()}/image/large.png" alt="">
            <h3>${el.find("title").text()}</h3>
            ${el
                .find("description")
                .text()}
            
            <a href="${el
                .find("link")
                .text()}" target="_blank" rel="noopener">More...</a>
          </article>
        `;

        document.getElementById("rss_publications").insertAdjacentHTML("afterend", template);
      });
    document.getElementById("rss_publications").remove();
  }
});

</script>