template: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	spec: {
		selector: matchLabels: {
			"app.oam.dev/component": parameter.name
		}
		template: {
			metadata: labels: {
				"app.oam.dev/component": parameter.name
			}
			spec: {
				containers: [{
					name:  parameter.name
					image: parameter.image
				}]
			}}}
}

parameter: {
	name:  "mytest"
	image: "nginx:v1"
}

// 映射遍历
parameter: {
	name:  string
	image: string
	env: [string]: string
}
output: {
	spec: {
		containers: [{
			name:  parameter.name
			image: parameter.image
			env: [
				for k, v in parameter.env {
					name:  k
					value: v
				},
			]
		}]
	}
}

// 类型遍历。
#a: {
	"hello": "Barcelona"
	"nihao": "Shanghai"
}

for k, v in #a {
	"\(k)": {
		nameLen: len(v)
		value:   v
	}
}

// 切片遍历。
parameter: {
	name:  string
	image: string
	env: [...{name: string, value: string}]
}
output: {
	...
	spec: {
		containers: [{
			name:  parameter.name
			image: parameter.image
			env: [
				for _, v in parameter.env {
					name:  v.name
					value: v.value
				},
			]
		}]
	}
}

// 导入包
import (
"strings",
"kube/apps/v1",
)

parameter: {
	outputs: [{ip: "1.1.1.1", hostname: "xxx.com"}, {ip: "2.2.2.2", hostname: "yyy.com"}]
	name: string
}
output: {
	v1.#Deployment
	metadata: name: parameter.name
	spec: {
		if len(parameter.outputs) > 0 {
			_x: [ for _, v in parameter.outputs {
				"\(v.ip) \(v.hostname)"
			}]
			message: "Visiting URL: " + strings.Join(_x, "")
		}
	}
}
