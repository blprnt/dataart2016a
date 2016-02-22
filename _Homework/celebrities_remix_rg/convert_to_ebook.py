from string import Template
import subprocess
import sys

script, input_html, output_ebook = sys.argv

with open('template.html', 'r') as infile:
	html_template = Template(infile.read())

with open(input_html, 'r') as infile:
	body_html = infile.read().strip()

body_div_list = body_html[len('<div>'):-len('</div>')].strip().split('</div>\n<div>')

def get_word_from_graf(graf):
	graflines = graf.split('\n')
	name = graflines[0][len('<p><strong>'):-len('</strong></p>')]
	return name

final_div_list = sorted(body_div_list, key=get_word_from_graf)

final_body_html = '<div>\n%s\n</div>' % '</div><div>'.join(final_div_list)

final_html = html_template.substitute(
	title="Deep Learning Defines Famous Names",
	body=final_body_html
)

with open('final.html', 'w') as outfile:
	outfile.write(final_html)

exec_list = ['ebook-convert', 'final.html', output_ebook]

proc = subprocess.Popen(exec_list)
proc.communicate()

