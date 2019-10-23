SRCDIR = src/
TARGET = presentation

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

pdfImages =                             \
  pics/bezier/bezier.pdf                \
  pics/bezier/bezier2.pdf               \
  pics/bezier/bezier3.pdf               \
  pics/catmullrom/catmullrom.pdf        \
  pics/catmullrom/catmullrom2.pdf       \
  pics/geometryShader/gs.pdf            \
  pics/geometryShader/PerTriangle.pdf   \
  pics/geometryShader/shadowvolume.pdf  \
  pics/tessellation/circle.pdf          \
  pics/tessellation/tess.pdf            \
  pics/tessellation/tess_control.pdf    \
  pics/tessellation/tess_coord.pdf      \
  pics/tessellation/tess_pipeline.pdf   \
  pics/transformFeedback/tf_mem.pdf     \
  pics/transformFeedback/tf_pipeline.pdf

all: ${pdfImages}
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	#bibtex $(TARGET)
	#pdflatex -shell-escape $(TARGET)
	#pdflatex -shell-escape $(TARGET)

clean:
	rm -rf *.aux *.pdf *.log *.toc *.bbl *.blg *.out *.nav *.snm *.pyg *.vrb _minted-presentation ${pdfImages}
