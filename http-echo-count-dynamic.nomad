# PLEASE NOTE: If you copy this file, be sure to replace <YOUR HOSTNAME>
# in the first line and in the "tags" section.
# Your hostname can be attained by running the "identity" command on your node.

job "http-echo-dynamic" {
	region = "local"
  datacenters = ["consul_cluster"]

  group "echo" {
    count = 10	 
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:latest"
        args  = [
          "-listen", ":${NOMAD_PORT_http}",
          "-text", "Welcome to the http-echo service. You are accessing ${NOMAD_IP_http}:${NOMAD_PORT_http}",
        ]
      }

      resources {
				cpu = 100 		// reserve 100 MHz
				memory = 64 	// reserve 64 MB

        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "http-echo-dynamic"
        port = "http"

        tags = [
          "masa_demo",
          "urlprefix-/http-echo",
        ]

        check {
          type     = "http"
          path     = "/health"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}
