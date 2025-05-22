extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vertices = PackedVector3Array()
	#front
	vertices.push_back(Vector3(0.1, 0.2, 0.1))
	vertices.push_back(Vector3(0.1, 0, 0.1))
	vertices.push_back(Vector3(-0.1, 0, 0.1))
	vertices.push_back(Vector3(0.1, 0.2, 0.1))

	
	#left
	vertices.push_back(Vector3(-0.1, 0.2, -0.1))
	vertices.push_back(Vector3(-0.1, 0.2, 0.1))
	vertices.push_back(Vector3(-0.1, 0.0, 0.1))
	vertices.push_back(Vector3(-0.1, 0.0, -0.1))

	var normals = PackedVector3Array()
	#front
	normals.push_back(Vector3(0.0, 0.0, 1.0))
	normals.push_back(Vector3(0.0, 0.0, 1.0))
	normals.push_back(Vector3(0.0, 0.0, 1.0))
	normals.push_back(Vector3(0.0, 0.0, 1.0))
	
	#left
	normals.push_back(Vector3(-1.0, 0.0, 0.0))
	normals.push_back(Vector3(-1.0, 0.0, 0.0))
	normals.push_back(Vector3(-1.0, 0.0, 0.0))
	normals.push_back(Vector3(-1.0, 0.0, 0.0))

	var indices = PackedInt32Array()
	indices = [0,1,2,
	0,2,3,
	4,5,6,
	4,6,7]
	# indices = [0,1,2,0,3,4,5,6,7,5,8,9]
	# indices.push_back(1)
	# indices.push_back(2)
	# indices.push_back(3)
	# indices.push_back(1)
	# indices.push_back(4)
	# indices.push_back(5)
	# indices.push_back(6)
	# indices.push_back(7)
	# indices.push_back(8)
	# indices.push_back(6)
	# indices.push_back(9)
	# indices.push_back(10)
	# Initialize and arrange the data for the single surface
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	arrays[Mesh.ARRAY_INDEX] = indices

	# Add the data as a surface to the ArrayMesh stored in the mesh property
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
