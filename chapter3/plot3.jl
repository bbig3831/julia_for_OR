using PyPlot

# Data
data = randn(100)
nbins = 10

# Creating a new figure object
fig = figure()

# Histogram
plt[:hist](data, nbins)

# Title
title("Histogram")

# Save the figure as PNG and PDFd
savefig("plot3.png")
savefig("plot3.pdf")

# Closing the figure object
close(fig)