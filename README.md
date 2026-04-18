# 📄 Abstract

Optical fiber communication networks require continuous fault monitoring to ensure reliable and uninterrupted data transmission. Physical impairments such as fiber cuts, bending losses, and poor splices can severely distort the backscattered optical signal, affecting overall network performance. Optical Time Domain Reflectometry (OTDR) serves as a powerful technique for detecting such degradations by analyzing the variation of reflected signal power along the fiber.

This project presents a MATLAB-based intelligent OTDR monitoring and self-healing system that simulates realistic OTDR traces, automatically identifies the presence and type of faults, and restores connectivity through dynamic rerouting. The system generates synthetic OTDR profiles for four conditions—Normal, Cut, Bend, and Splice—using a custom trace generation model that reflects attenuation patterns and fault-induced power deviations.

Key signal features such as drop magnitude, slope change, and local variation are extracted and classified using a Decision Tree algorithm, selected for its simplicity, fast execution, and suitability for OTDR pattern recognition. Upon fault detection, the system activates a self-healing module that uses Dijkstra’s Shortest Path Algorithm to compute an optimal alternate route, ensuring continuous communication.

The integrated MATLAB GUI provides an interactive platform for visualization, analysis, fault interpretation, and dynamic rerouting. The system is scalable, supports real-time processing, and can be extended to include additional fault categories for advanced analysis.
