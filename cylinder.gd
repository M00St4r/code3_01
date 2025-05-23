extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var radius = float(0.1)

	var height = float(0.2)

	var pos = Vector3(0, 0.3, 0)

	var resolution = 16

	var vertices = PackedVector3Array()

	var normals = PackedVector3Array()

	var indices = PackedInt32Array()

	generateDisc(resolution, height/2, radius, vertices, normals, indices, pos)
	generateCylinder(resolution, -height/2, radius, vertices, normals, indices, pos)

	# Initialize and arrange the data for the single surface
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_INDEX] = indices
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	

	# Add the data as a surface to the ArrayMesh stored in the mesh property
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)

func generateDisc(resolution, height, radius, vertices, normals, indices, pos):
	#center point
	var center = Vector3(pos.x, pos.y + height, pos.z)
	vertices.push_back(center)
	var normal = Vector3(0, 1 if height != 0 else -1, 0)
	normals.push_back(normal)

	#generate disc points
	for i in range(resolution + 1):
		var angle = 2.0 * PI * float(i) / float(resolution)
		var x = radius * cos(angle) + pos.x
		var z = radius * sin(angle) + pos.z
		var y = pos.y + height

		vertices.push_back(Vector3(x, y, z))
		normals.push_back(normal)

	# generate triangles
	for i in range(1, resolution):
		indices.push_back(0) # center vertex
		indices.push_back(i)
		indices.push_back(i + 1)

	# connect start and end of disc
	indices.push_back(0)
	indices.push_back(resolution)
	indices.push_back(1)

func generateCylinder(resolution, height, radius, vertices, normals, indices, pos):
	#center point
	var center = Vector3(pos.x, pos.y + height, pos.z)
	vertices.push_back(center)
	var normal = Vector3(0,1,0)
	normals.push_back(normal)

	#generate disc points
	for i in range(resolution + 1):
		var angle = 2.0 * PI * float(i) / float(resolution)
		var x = radius * cos(angle) + pos.x
		var z = radius * sin(angle) + pos.z
		var y = pos.y + height

		vertices.push_back(Vector3(x, y, z))
		normals.push_back(normal)

	# generate wall triangles
	for i in range(1, resolution + 1):
		indices.push_back(i)
		indices.push_back(i + resolution + 2)
		indices.push_back(i + 1)

		indices.push_back(i + resolution + 2)
		indices.push_back(i + resolution + 3)
		indices.push_back(i + 1)

	# generate floor triangles
	for i in range(1, resolution + 1):
		indices.push_back(resolution + 2) # center vertex
		indices.push_back(i + resolution + 2)
		indices.push_back(i + resolution + 1)

	# connect start and end of disc
	indices.push_back(resolution + 2)
	indices.push_back(resolution + 3)
	indices.push_back(resolution * 2 + 2)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
