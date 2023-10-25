# watermark_ip
Watermarking ip. Generic Xilinx Platform. VHDL. Includes Simulink files.

Please, refer to the [Dzhanashia, Evsutin "Low complexity template-based watermarking with neural networks and various embedding templates." Computers and Electrical Engineering 102 (2022): 108194. doi: 10.1016/j.compeleceng.2022.108194] for full algorithm description.


The embedding process summary:

Because we aim to achieve low complexity of the scheme and do not aim to get high security, we choose simple embedding operations. One such operation is a linear combination. Linear embedding can be written as follows:

I'=I*α∙W,	(1)

where I' is a watermarked image, I is an initial image, ‘*’ denotes linear operation, α is an embedding strength, and W is a watermark.

The question arises of how to present W. In the easiest case W is a binary sequence and is embedded as such. This option allows for high capacity and imperceptibility; however, to achieve high robustness some preliminary watermark processing is needed.
One form of such processing that adds redundancy to a watermark is the use of templates. In template-based methods, bits correspond to some templates. In this case, there are two templates. The first one corresponds to bits that equal zero. The second one corresponds to bits that equal one.  Templates are used to construct a template-watermark. One of the templates is taken with a negative sign during template-watermark construction (see Figure 1).


![Figure 1](https://github.com/DzhanashiaKrsitina/watermark_ip/assets/46706424/aadf908b-6931-4e1d-b135-7d67d2e22200)

Figure 1:	Template-watermark construction. The template and watermark sizes are presented smaller in the figure for illustrative purposes

Template-watermark is merged with a container. This method’s advantage is its simplicity as a linear combination of a container and a template-watermark does not require significant resources.

The embedding is done per the above formula through merging of template-watermark with a container:

I'_R =I_R,

I'_G =I_G,

I'_B =I_B+α∙template-watermark

where I_R  , I_G  , I_B  are RGB channels of an initial image, I'_R  , I'_G  , I'_B  are RGB channels of a watermarked image, α is the embedding strength. The blue channel is chosen for embedding due to the HVS properties. Human eyes are less sensitive to changes in blue channel than in other ones.

The embedding of the template-watermark is illustrated in Figure 2.

![Figure 2](https://github.com/DzhanashiaKrsitina/watermark_ip/assets/46706424/f18f9bd4-8a07-47dd-b58f-34f2fa403a32).

Figure 2:	Template-watermark embedding into an image

Templates have constant sizes of 32 × 32. The template-watermark size depends on the image container size. The biggest area of an image container that is a multiple of one template size in terms of width and height is used for embedding.
