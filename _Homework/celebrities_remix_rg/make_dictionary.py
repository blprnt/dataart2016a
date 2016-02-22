import json

from bot import make_definition_tweet

with open('names.json', 'r') as infile:
    names = json.load(infile)

html_chunks = list()

for i, n in enumerate(names[:100]):
    try:
        print "DEFINING: %s, %i/100" % (n, i+1)
        definition = make_definition_tweet(n).decode('utf8').encode('ascii', 'xmlcharrefreplace')
        def_html = '<p><strong>%s</strong></p>\n<p>%s</p>' % (n.decode('utf8').encode('utf8').decode('utf8').encode('ascii', 'xmlcharrefreplace'), definition.replace('\n', '</p>\n<p>'))
        html_chunks.append(def_html)
    except:
        print "ERROR: %s" % n

    if i % 10 == 0:
        final_html = '<div>\n%s\n</div>' % '</div>\n<div>'.join(html_chunks)
        print final_html
        with open('out.txt', 'w') as outfile:
            outfile.write(final_html)


final_html = '<div>\n%s\n</div>' % '</div>\n<div>'.join(html_chunks)



with open('dictionary.html', 'w') as outfile:
    outfile.write(final_html.decode('utf8'))
