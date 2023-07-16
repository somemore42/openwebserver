<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>网站地图</title>
      </head>
      <body>
        <h2 align="center">目录</h2>
               <table border="1" align="center"  cellspacing="0" cellpadding="0" width="90%">
            <tr><th bgcolor="green">URL地址</th><th bgcolor="blue">更改日期</th><th bgcolor="red">更新频率</th><th bgcolor="yellow">分级</th></tr>
        <xsl:for-each select="urlset/url">
        <tr>
         <td><a onclick="top.location=this.textContent" target="_blank"><xsl:value-of select="loc"/></a></td>
       <td><xsl:value-of select="lastmod"/></td>
         <td><xsl:value-of select="changefreq"/></td>
         <td><xsl:value-of select="priority"/></td>
        </tr>
       </xsl:for-each>
      </table>     
       </body>
    </html>
  </xsl:template>
</xsl:stylesheet>