function createProject(vendor)
	hasCL = findOpenCL(vendor)
	
	if (hasCL) then
		
		project ("Bullet3OpenCL_" .. vendor)
	
		initOpenCL(vendor)
			
		kind "StaticLib"
		
        if os.istarget("Linux") then
            buildoptions{"-fPIC"}
        end
		
		includedirs {
			".",".."
		}
		
		files {
			"**.cpp",
			"**.h"
		}
		
	end
end

createProject("clew")
createProject("AMD")
createProject("Intel")
createProject("NVIDIA")
createProject("Apple")
