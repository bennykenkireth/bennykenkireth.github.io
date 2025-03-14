# Copyright (c) 2010-2024 Pablo de Oliveira Castro and contributors 
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


# This plugin interfaces bibtex2html (http://www.lri.fr/~filliatr/bibtex2html/) with Jekyll
# to generate an html bibliography list from bibtex entries.
# For this to work, the bibtex entries must be enclosed in a special liquid tag:
# {% bibtex style.bst mybibliography.bib %}

module Jekyll
  # Workaround for commit 5b680f8dd80aac1 in jekyll (remove orphaned files in destination)
  # that deletes all the files created by plugins.
  class Site
    def cleanup
    end
  end

  class BibtexTag < Liquid::Tag
    # The options that are passed to bibtex2html
    Options = "-nofooter -noheader -nokeywords -nokeys -nodoc -dl"

    def split_params(params)
      params.split(" ").map(&:strip)
    end

    def initialize(tag_name, params, tokens)
      super
      args = split_params(params)
      @style = args[0]
      @bibfile = args[1]
      p "Processing: " + @bibfile 
    end

    def render(context)
      # get the complete paths for the style file and the source file
      stylepath = File.join(context['site']['source'], @style)

      sourcedir = File.join(context['site']['source'], context['page']['dir'])
      bib = File.join(sourcedir, @bibfile)

      outputdir = File.join(context['site']['destination'], context['page']['dir'])

      # ensure that the destination directory exists
      FileUtils.mkdir_p(outputdir)

      # enter the destination directory
      Dir.chdir(outputdir) do
          basename = File.basename(bib).split('.')[-2]
          # file generated by bibtex2html that shall be included into
          # the generated page
          outname = basename + ".html"
          # file containing bib entries (also generated by bibtex2html)
          bibhtml = basename + "_bib.html"

          # call bibtex2html
          system("bibtex2html #{Options} -s #{stylepath} -o #{basename} #{bib}")

          if $? != 0
              msg = "bibjekyll error: bibtex2html invocation failed"
              $stderr.puts(msg)
              return msg
          end

          # Fix back links in the html formatted bib file
          # generated by bibtex2html
          if File.exist?(bibhtml)
              # Read html formatted bib file
              content_bibhtml = IO.read(bibhtml)
              # determine the name of the file we are generating
              # replace links to basename by page
              content_bibhtml = content_bibhtml.gsub(outname, context['page']['url'])
              # commit changes
              File.open(bibhtml, 'w') {|f| f.write(content_bibhtml)}
          end

          # return the produced output
          IO.read(outname)
      end
    end
  end
end
Liquid::Template.register_tag('bibtex', Jekyll::BibtexTag)
