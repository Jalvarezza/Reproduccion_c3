package cl.duoc.caso03.reproduccion;

import org.junit.jupiter.api.Test;
import cl.duoc.caso03.reproduccion.config.OpenApiConfig;

import static org.assertj.core.api.Assertions.assertThat;

class OpenApiConfigTest {

    @Test
    void beanOpenApiGenerado() {
        assertThat(new OpenApiConfig().customOpenAPI()).isNotNull();
    }
}
